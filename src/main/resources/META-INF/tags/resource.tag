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
<%@ tag body-content="empty" description="Expose a set of server-side routes as a RESTful resource"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="module" required="true" type="java.lang.String" description="The Angular module to assign the constant to." %>
<%@ attribute name="name" required="true" type="java.lang.String" description="The service name." %>
<%@ attribute name="routes" required="true" type="java.util.Map" description="A map of routes." %>

angular.module('${module}').factory('${name}', ['$http', function ($http) {
	var URL_TOKEN_PATTERN = /\{([^\}]*)\}/g;

	function reverse(path, vars) {
		var err = 'Unable to reverse route `' + path + '` with path vars: ' + vars,
		match, token, varName, varValue;

		while (match = URL_TOKEN_PATTERN.exec(path)) {
			if (!vars) throw err;

			token = match[0];
			varName = match[1];
			varValue = vars[varName];
			if (!varValue) throw err;
			path = path.replace(token, varValue);
		}
		return path;
	}

	function makeRequest(path, method, config) {
		config = angular.extend(config || {}, {
			method: method,
			url: path
		});
		return $http(config);
	}

	return {
	<c:forEach var="entry" items="${routes}" varStatus="loop">
		<c:set var="name" value="${entry.key}"/>
		<c:set var="route" value="${entry.value}"/>
		'${name}': function(config) {
			var path = reverse('${entry.value.route}', config.pathVars);
			return makeRequest(path, '${entry.value.routeType}', config);
		}<c:if test="${!loop.last}">,</c:if>
	</c:forEach>
	}
}]);