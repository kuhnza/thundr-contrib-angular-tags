<%@ tag body-content="empty" description=""%>
<%@ tag import="com.threewks.thundr.route.RouteNotFoundException"%>
<%@ tag import="java.util.Map"%>
<%@ tag import="com.threewks.thundr.route.Routes"%>
<%@ tag import="com.threewks.thundr.route.Route"%>

<%@ attribute name="module" required="true" type="java.lang.String" description="The Angular module to assign the constant to." %>
<%@ attribute name="name" required="true" type="java.lang.String" description="The route name." %>
<%@ attribute name="route" required="true" type="java.lang.String" description="Object to inject as Angular constant. Strings will be passed as-is while objects will be serialized to JSON." %>
<%@ tag dynamic-attributes="pathVars" body-content="empty"%>

<%
	JspContext context = getJspContext();
	Map<String, Object> pathVars = (Map<String, Object>) context.getAttribute("pathVars", PageContext.PAGE_SCOPE);
	Routes routes = (Routes) request.getAttribute("routes");
	Route r = routes.getRoute(route);
	if (r == null) {
		throw new RouteNotFoundException("No route named %s exists", name);
	}
	context.setAttribute("reverse", r.getReverseRoute(pathVars));
%>

angular.module('${module}').constant('${name}', '${reverse}');