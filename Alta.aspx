<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="PARCIAL1_LUCAS_MORALES.Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link href="Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h2>FUNCIÓN PARA CARGAR NUEVO PRODUCTO</h2>
            
            <div class="form-group">
                <label>Nombre del Producto:</label>
                <asp:TextBox ID="TXTnombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Precio:</label>
                <asp:TextBox ID="TXTprecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Categoría:</label>
                <asp:DropDownList ID="DDLcategoria" runat="server" CssClass="form-control" 
                    DataSourceID="SqlDataSourceCategorias" 
                    DataTextField="descripcion" 
                    DataValueField="idCategoria">
                </asp:DropDownList>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TiendaRetroConnectionString %>" 
                SelectCommand="SELECT [idCategoria], [descripcion] 
                FROM [categorias] ORDER BY [descripcion]" 
                ProviderName="<%$ ConnectionStrings:TiendaRetroConnectionString.ProviderName %>">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConexionTienda %>" 
                InsertCommand="INSERT INTO productos (nombre, precio, categoria) VALUES (@nombre, @precio, @categoria)">
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Decimal" />
                    <asp:Parameter Name="categoria" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

            <div class="form-group">
                <asp:Button ID="BTconfirmar" runat="server" Text="Confirmar" CssClass="btn-accion" OnClick="BTconfirmar_Click" />
            </div>
            
            <asp:Label ID="LBmensaje" runat="server" Font-Bold="true"></asp:Label>
            
            <div class="menu-navegacion">
                <asp:HyperLink ID="HLvolver" runat="server" NavigateUrl="~/Default.aspx">Volver a la página principal</asp:HyperLink>
            </div>
        </div>
    </form>
</body>>
</body>
</html>
