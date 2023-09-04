[class^='<%= options.prefix %>'], [class*=' <%= options.prefix %>'] { background-image:url('<%= options.spritePath %>'); 
<% if (options.commonWidth) { %>width:<%= getCSSValue(options.commonWidth) %>; height:<%= getCSSValue(options.commonHeight) %>; <% } %>}
<% layout.images.forEach(function (image) { %>.<%= image.className %> { background-position:<%= getCSSValue(-image.x) %> <%= getCSSValue(-image.y) %>; <% if (!options.commonWidth) { %>width:<%= getCSSValue(image.width) %>; height:<%= getCSSValue(image.height) %>; <% } %>}
<% }); %>
