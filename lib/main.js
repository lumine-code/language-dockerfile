exports.activate = function () {};

exports.consumeHyperlinkInjection = (hyperlink) => {
  return hyperlink.addInjectionPoint("source.dockerfile", {
    types: ["comment"],
  });
};

exports.consumeTodoInjection = (todo) => {
  return todo.addInjectionPoint("source.dockerfile", {
    types: ["comment"],
  });
};
