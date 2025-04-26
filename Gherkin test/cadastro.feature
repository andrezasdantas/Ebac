 Aluna: Andreza da Silva Dantas         
        
 
 Cenário: Registro com todos os campos obrigatórios preenchidos
    Quando o usuário preenche "Nome", "Sobrenome", "Email" e "Senha"
    E seleciona clica no botão "Cadastrar"
    Então o sistema exibe uma mensagem de sucesso

  Cenário: Envio de e-mail de confirmação após o registro bem-sucedido
    Quando o usuário completar o registro com sucesso
    Então um e-mail de confirmação é enviado para o endereço de e-mail fornecido

  Esquema do Cenário: Validação dos campos de registro
    Quando o usuário preenche <Nome>, <Sobrenome>, <Email>, <Telefone> e <Senha>
    Então o sistema valida os campos e retorna "<Resultado>"

    Exemplos:
      | Nome  	| Sobrenome 	| Email          		| Telefone  	| Senha		    | Resultado	        |
      | Ana    	| Silva     	| ana@email.com   	    | 11999887766	| An@1234!	    | Sucesso    	    |
      | João  	|          	 	| joao@email.com  	    |             	| João#4321   	| Falha         	|
      | Maria 	| Pereira   	| mariapereira.com  	| 21988776655	| Mp3re1ra    	| Falha         	|
      | Pedro 	| Alves     	| pedro@email.com 	    |             	| Pe@1        	| Falha         	|
      |        	| Santos    	| luis@email.com    	| 31987654321	| Lu1s*6789   	| Falha         	|
