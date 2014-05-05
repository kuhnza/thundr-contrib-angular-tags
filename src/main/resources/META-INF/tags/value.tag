<%@ tag body-content="empty" description=""%>
<%@taglib prefix="ng" uri="http://threewks.com/thundr/angular/tags"%>

<%@ attribute name="module" required="true" type="java.lang.String" description="The Angular module to assign the value to." %>
<%@ attribute name="name" required="true" type="java.lang.String" description="The value name." %>
<%@ attribute name="value" required="true" type="java.lang.Object" description="Object to inject as Angular value. Strings and numbers will be passed as-is while objects will be serialized to JSON." %>

<% if (value instanceof String) { %>
	angular.module('${module}').value('${name}', '${value}');
<% } else if (value instanceof Number) { %>
	angular.module('${module}').value('${name}', ${value});
<% } else { %>
	angular.module('${module}').value('${name}', <ng:json value="${value}"/>);
<% } %>