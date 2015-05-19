<%--

    This file is a component of thundr, a software library from 3wks.
    Read more: http://www.3wks.com.au/thundr
    Copyright (C) 2013 3wks, <thundr@3wks.com.au>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ tag body-content="empty" description=""%>
<%@ tag import="com.threewks.thundr.route.RouteNotFoundException"%>
<%@ tag import="java.util.Map"%>
<%@ tag import="com.threewks.thundr.route.Router"%>
<%@ tag import="com.threewks.thundr.route.Route"%>

<%@ attribute name="module" required="true" type="java.lang.String" description="The Angular module to assign the constant to." %>
<%@ attribute name="name" required="true" type="java.lang.String" description="The route name." %>
<%@ attribute name="route" required="true" type="java.lang.String" description="Object to inject as Angular constant. Strings will be passed as-is while objects will be serialized to JSON." %>
<%@ tag dynamic-attributes="pathVars" body-content="empty"%>

<%
	JspContext context = getJspContext();
	Map<String, Object> pathVars = (Map<String, Object>) context.getAttribute("pathVars", PageContext.PAGE_SCOPE);
	Router router = (Router) request.getAttribute("router");
	Route r = router.getNamedRoute(route);
	if (r == null) {
		throw new RouteNotFoundException("No route named %s exists", route);
	}
	context.setAttribute("reverse", r.getReverseRoute(pathVars));
%>

angular.module('${module}').constant('${name}', '${reverse}');