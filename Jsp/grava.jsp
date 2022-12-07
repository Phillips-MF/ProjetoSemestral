<%@page language="java" import="java.sql.*"%> 
<%
    //Pegando os dados do formulário
    String vnome = request.getParameter("txt_nome");
    String vcpf = request.getParameter("txt_cpf");
    String vemail = request.getParameter("txt_email");
    String vtelefone = request.getParameter("txt_telefone");

    //Realizando a conexão com o banco de dados
    String banco = "projeto_integrador";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    //Conectando com o banco
    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver);
    Connection conexao = DriverManager.getConnection(endereco,usuario,senha);

    //Preparando os comandos SQL para a tabela clientes
    String sql_cliente = "INSERT INTO cliente (cpf, nome, email, telefone) values(?,?,?,?)";

    PreparedStatement stm_cliente = conexao.prepareStatement(sql_cliente);
    stm_cliente.setString(1, vcpf);
    stm_cliente.setString(2, vnome);
    stm_cliente.setString(3, vemail);
    stm_cliente.setString(4, vtelefone);

    stm_cliente.execute();
    stm_cliente.close();
    
    out.print("Pedido de agendamento realizado com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='index.html'>Home</a>");
%>