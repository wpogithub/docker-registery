<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User ${user.username}</title>
</head>

<body>
<div class="row">
    <div class="col-md-8 col-lg-offset-2">
        <ol class="breadcrumb">
            <li><g:link uri="/">Home</g:link></li>
            <li><g:link action="index">Users</g:link></li>
            <li class="active">User ${user.username}</li>
        </ol>

        <div class="page-header"><h3>User: ${user.username}
            <span class="pull-right">
                <g:if test="${user.accountLocked}">
                    <span class="label label-default">
                        <span class="glyphicon glyphicon-ban-circle" aria-label="Locked"></span>
                        Locked</span></g:if>
                <g:link class="btn btn-primary" action="edit" id="${user.id}">Modify</g:link>
                <g:link class="btn btn-danger" action="delete" id="${user.id}">Delete</g:link></span></h3>
        </div>
        <h4>Roles:</h4>
        <ul>
            <g:each in="${user.authorities}" var="role">
                <li>${role.authority} <g:link action="deleteRole" id="${role.id}"
                                              params="[userId: user.id]">
                    <span class="glyphicon glyphicon-remove text-danger" aria-label="remove"></span></g:link></li>
            </g:each>

            <g:if test="${roles}">
                <g:form action="addRole" class="form-inline">

                    <g:hiddenField name="userId" value="${user.id}"/>
                    <li>
                        <g:select class="form-control" from="${roles}" name="roleId" optionKey="id"
                                  optionValue="authority"/>

                        <g:submitButton name="Add" class="btn btn-primary"/>
                    </li>

                </g:form>
            </g:if>
        </ul>
    </div>
</div>
</body>
</html>
