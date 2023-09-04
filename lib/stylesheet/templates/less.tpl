<% layout.images.forEach(function (image) { %>@<%= image.className %>-x: <%= getCSSValue(-image.x) %>;
@<%= image.className %>-y: <%= getCSSValue(-image.y) %>;
@<%= image.className %>-width: <%= getCSSValue(image.width) %>;
@<%= image.className %>-height: <%= getCSSValue(image.height) %>;
@<%= image.className %>: @<%= image.className %>-x, @<%= image.className %>-y, @<%= image.className %>-width, @<%= image.className %>-height;
<% }); %>
.<%= spriteName %>-image() {
    background-image: url('<%= options.spritePath %>');
}
.<%= spriteName %>-position(@sprite) {
    background-position: extract(@sprite, 1) extract(@sprite, 2);
}
.<%= spriteName %>-width(@sprite) {
    width: extract(@sprite, 3);
}
.<%= spriteName %>-height(@sprite) {
    height: extract(@sprite, 4);
}
.<%= spriteName %>(@sprite) {
    .<%= spriteName %>-image();
    .<%= spriteName %>-position(@sprite);
    .<%= spriteName %>-width(@sprite);
    .<%= spriteName %>-height(@sprite);
}
