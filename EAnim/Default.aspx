<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EAnim._Default" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link href="Default.css" rel="stylesheet" />
    <script src="Default.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Body">
        <div id="Menu">
            <div ng-clic="Template = 'Prestations'">Préstations</div>
            <div ng-clic="Template= 'Calendrier'">Calendrier</div>
        </div>
        <div id="Content" ng-include="'/Templates/' + Template + '.html'"></div>
</asp:Content>
