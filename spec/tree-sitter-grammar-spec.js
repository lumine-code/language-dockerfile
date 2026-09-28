const fs = require("fs");
const path = require("path");
const { Point } = require("lumine");

const highlightsPath = path.join(__dirname, "..", "grammars", "dockerfile-highlights.scm");

// Asserts the scopes the grammar actually produces, using the fixture beside
// this file. `runGrammarTests` reads `<- scope` and `^ scope` assertions out of
// the fixture's own comments, so the fixture is the readable spec.
//
// A fixture whose assertions never run still reports green, so break one
// expected scope and confirm this fails before trusting it.

describe("Dockerfile Tree-sitter grammar", () => {
  beforeEach(async () => {
    await lumine.packages.activatePackage("language-dockerfile");
  });

  it("tokenizes the fixture", async () => {
    await runGrammarTests(path.join(__dirname, "fixtures", "sample.Dockerfile"), /#/);
  });

  it("keeps heredoc body captures local inside a large block", async () => {
    const query = fs.readFileSync(highlightsPath, "utf8");
    expect(query).not.toContain("(heredoc_block\n  (heredoc_line)");
    expect(query).toContain("(#is? test.childOfType heredoc_block)");

    const editor = await lumine.workspace.open("Dockerfile");
    editor.setText(
      [
        "FROM alpine",
        "RUN <<EOF",
        ...Array.from({ length: 6000 }, (_, index) => `value_${index}`),
        "EOF",
        "",
      ].join("\n"),
    );
    await editor.languageMode.ready;

    expect((await editor.getSyntaxDiagnostics()).hasError).toBe(false);
    expect(editor.scopeDescriptorForBufferPosition([3000, 0]).getScopesArray()).toContain(
      "string.unquoted.heredoc.dockerfile",
    );
    const groups = await editor.getGrammarQueryCaptureGroups("highlightsQuery", {
      startPosition: new Point(3000, 0),
      endPosition: new Point(3006, 0),
    });
    const captures = groups
      .find(({ grammar }) => grammar === editor.getGrammar())
      .captures.filter(({ name }) => name === "string.unquoted.heredoc.dockerfile");
    expect(captures.length).toBe(6);
    expect(
      captures.every(({ node }) => node.startPosition.row >= 3000 && node.startPosition.row < 3006),
    ).toBe(true);
  });
});
