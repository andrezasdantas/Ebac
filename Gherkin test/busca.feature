Aluna: Andreza da Silva Dantas         
          
            
            
            Funcionalidade: Busca de filmes

            # Cenários básicos (critérios de aceitação originais)
            Cenário: Busca com palavra-chave válida
            Dado que o usuário está na página inicial
            Quando ele digita "O Poderoso Chefão" no campo de busca
            E clica no botão "BUSCAR"
            Então o sistema exibe uma lista de filmes contendo "O Poderoso Chefão" nos resultados
            E cada resultado mostra:
            | Elemento      | Presente? |
            | Capa do filme | Sim       |
            | Título        | Sim       |
            | Sinopse curta | Sim       |

            Cenário: Busca sem resultados
            Dado que o usuário está na página de busca
            Quando ele digita "zxqwy123" no campo de busca
            E clica em "BUSCAR"
            Então o sistema exibe a mensagem: "Nenhum filme encontrado para 'zxqwy123'"
            E mantém o campo de busca preenchido com o termo digitado

            Cenário: Limpar busca
            Dado que o usuário pesquisou por "Aventura"
            E vê 8 filmes nos resultados
            Quando ele clica em "Limpar Busca"
            Então o campo de busca é esvaziado
            E a lista de filmes volta ao estado inicial (exibindo os filmes em destaque)

            # Cenários estendidos para cobertura completa
            Cenário: Busca em tempo real (digitação progressiva)
            Dado que o usuário começa a digitar "Star" no campo de busca
            Quando o sistema detecta 300ms de inatividade após cada caractere
            Então os resultados são atualizados dinamicamente para:
            | Texto digitado | Resultados esperados                 |
            | "S"            | Exibe filmes com "S" no título       |
            | "St"           | Filmes com "St" no título            |
            | "Star"         | Filmes da saga "Star Wars/Star Trek" |

            Cenário: Ordenação dos resultados
            Dado que a busca por "Guerra" retorna 15 filmes
            Quando os resultados são exibidos
            Então os filmes estão ordenados por:
            1. Popularidade (mais alto no IMDB)
            2. Nota (IMDB rating decrescente)
            3. Título (ordem alfabética em caso de empate)

            Cenário: Paginação de resultados
            Dado que a busca por "Ação" retorna 23 filmes
            Quando a lista é exibida
            Então o sistema mostra apenas 10 filmes por página
            E oferece controles de paginação com:
            | Elemento          | Funcionalidade                |
            | "Próxima página"  | Carrega os próximos 10 filmes |
            | "Página anterior" | Volta aos 10 anteriores       |
            | Indicador         | "Página 1 de 3"               |

            Cenário: Busca com caracteres especiais
            Dado que o usuário digita "Pokémon" no campo de busca
            Quando a busca é executada
            Então o sistema retorna filmes com "Pokémon" no título
            E ignora acentos/caracteres especiais em buscas por "Pokemon"

            Cenário: Performance da busca
            Dado que o usuário digita um termo popular ("Harry Potter")
            Quando a busca é acionada
            Então os resultados são exibidos em menos de 1 segundo
            E o sistema mantém responsividade durante a digitação (atualizações em <300ms)

            Cenário: Busca vazia
            Dado que o usuário deixa o campo de busca vazio
            Quando clica em "BUSCAR"
            Então o sistema exibe a mensagem: "Digite um termo para buscar"
            E mantém a lista inicial de filmes em destaque

            Cenário: Acessibilidade na busca
            Dado que o usuário navega por teclado
            Quando ele tabula até o campo de busca
            Então o campo tem:
            | Atributo          | Valor correto              |
            | aria-label        | "Campo de busca de filmes" |
            | aria-autocomplete | "list"                     |
            | role              | "searchbox"                |

Cenário: Fallback de API
Dado que a API de busca está indisponível
Quando o usuário tenta buscar "Drama"
Então o sistema exibe: "Busca temporariamente indisponível"
E sugere "Tente novamente em alguns minutos"
E mantém a lista de filmes em destaque visível

Cenário: Persistência da busca
Dado que o usuário buscou por "Comédia"
E vê os resultados
Quando ele recarrega a página
Então o campo de busca mantém o termo "Comédia"
E os resultados são recarregados automaticamente

# Edge cases
Cenário: Termo de busca muito longo
Dado que o usuário digita 150 caracteres no campo de busca
Quando ele tenta buscar
Então o sistema trunca para os primeiros 100 caracteres
E executa a busca normalmente

Cenário: Busca sensível ao contexto
Dado que o usuário busca "rei"
Quando os resultados são exibidos
Então o sistema prioriza:
1. Filmes com "rei" no título ("O Rei Leão")
2. Filmes sobre reis ("Coração Valente")
3. Filmes com "rei" na sinopse