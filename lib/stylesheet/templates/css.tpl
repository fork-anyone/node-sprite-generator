/** sprite.png width: <%= layout.width %> height: <%= layout.height %> sizes:<%= layout.images.length %> **/ 
<% layout.images.forEach(function (image) { %>
    /** x: <%=image.x%> y: <%=image.y%> **/ 
    .<%= image.className %> {
        background-image: url('<%= options.spritePath %>');
        background-position: <%= getCSSValue(-image.x) %> <%= getCSSValue(-image.y)%>;
        width: <%= getCSSValue(image.width) %>; 
        height: <%= getCSSValue(image.height) %>;
    }
<% }); %>

<% if (layout.scaleSizes) { %>
    /** scale css <%= layout.scaleSizes?.length %>  **/
    <% layout.scaleSizes.forEach(function (size) { %>
        /** scale-size:  <%=size.x%>  <%=size.y%> **/ 
        <% layout.images.forEach(function (image) { %>
            <% var scaleX = 1, scaleY = 1 %>
            <% scaleX = size.x ? size.x / image.width : (size.y ? size.y / image.height : 1); %>
            <% scaleY = size.y ? size.y / image.height : scaleX; %>
            /** scale-x: <%=scaleX%> scale-y: <%=scaleY%> **/ 
            .<%= image.className %>.s<%=image.width * scaleX%>-<%=image.height * scaleY %>  { 
                background-image: url('<%= options.spritePath %>');
                background-position: <%= getCSSValue(-image.x * scaleX) %> <%= getCSSValue(-image.y * scaleY)%>;
                background-size: <%= getCSSValue(image.width * scaleX ) %> auto; 
                width: <%= getCSSValue(image.width * scaleX ) %>; 
                height: <%= getCSSValue(image.height * scaleY) %>;
            }
        <% }); %>
    <% }); %>
    
<% } %>
