<%@ tag import="com.google.gson.GsonBuilder" %>
<%@ tag body-content="empty" description=""%>
<%@ attribute name="value" required="true" type="java.lang.Object" description="Object to convert to JSON." %>
<%@ attribute name="gson" required="false" type="com.google.gson.Gson" description="Override the default Gson instance to perform the JSON conversion with" %>
<%
	if (gson == null) {
		gson = new GsonBuilder().setPrettyPrinting().create();
	}
	out.print(gson.toJson(value));
%>