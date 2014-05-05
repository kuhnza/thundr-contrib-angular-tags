<%@ tag body-content="empty" description=""%>
<%@ taglib prefix="ng" uri="http://threewks.com/thundr/angular/tags"%>

<%@ attribute name="module" required="true" type="java.lang.String" description="The Angular module to assign the constant to." %>
<%@ attribute name="name" required="true" type="java.lang.String" description="The constant name." %>
<%@ attribute name="value" required="true" type="java.lang.Object" description="Object to inject as Angular constant. Strings and numbers will be passed as-is while objects will be serialized to JSON." %>

<% if (value instanceof String) { %>
	angular.module('${module}').constant('${name}', '${value}');
<% } else if (value instanceof Number) { %>
	angular.module('${module}').constant('${name}', ${value});
<% } else { %>
	angular.module('${module}').constant('${name}', <ng:json value="${value}"/>);
<% } %>