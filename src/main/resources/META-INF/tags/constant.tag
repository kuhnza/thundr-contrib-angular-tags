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