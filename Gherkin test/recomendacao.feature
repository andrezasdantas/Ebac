Aluna: Andreza da Silva Dantas         
           
            
            
            Funcionalidade: Recomendações de filmes

            Cenário: Exibição básica das recomendações
            Dado que o usuário acessa a página inicial
            Quando a página é carregada
            Então o sistema exibe a seção "Recomendações do Dia"
            E verifica-se que há entre 4 e 5 filmes recomendados
            E cada item contém:
            | Elemento      | Presente? |
            | Capa do filme | Sim       |
            | Título        | Sim       |
            | Sinopse       | Sim       |

            Cenário: Atualização diária bem-sucedida
            Dado que a API de recomendações está operacional
            E é um novo dia (data diferente do último carregamento)
            Quando o sistema atualiza as recomendações
            Então os filmes exibidos são diferentes dos do dia anterior
            E a data de atualização é registrada no sistema

            Cenário: Fallback em caso de falha na API
            Dado que a API de recomendações está indisponível
            E existem recomendações carregadas no dia anterior
            Quando o sistema tenta atualizar as recomendações
            Então o sistema mantém os filmes do dia anterior
            E exibe um log de erro para a equipe técnica
            E o usuário não percebe a falha (experiência não é impactada)

            Cenário: Conteúdo das recomendações
            Dado que as recomendações foram carregadas com sucesso
            Quando o usuário visualiza a seção
            Então cada filme recomendado deve ter:
            | Campo              | Validação                          |
            | Título             | Não vazio e com até 100 caracteres |
            | Capa               | URL válida e imagem acessível      |
            | Sinopse            | Entre 50-300 caracteres            |
            | Link para detalhes | URL válida                         |

            Cenário: Navegação entre recomendações
            Dado que há 5 filmes recomendados
            Quando o usuário interage com o carrossel de recomendações
            Então pode navegar para ver todos os 5 filmes
            E cada item é exibido corretamente durante a navegação

            Cenário: Critérios de seleção dos filmes
            Dado que o sistema está selecionando filmes para recomendação
            Quando a lista é gerada
            Então todos os filmes devem ter:
            | Critério             | Valor mínimo   |
            | Popularidade (IMDb)  | 7.0+           |
            | Número de avaliações | 5000+          |
            | Data de lançamento   | Últimos 2 anos |

            Cenário: Responsividade da exibição
            Dado que o usuário acessa por diferentes dispositivos
            Quando visualiza a seção de recomendações
            Então o layout se adapta corretamente em:
            | Dispositivo | Resolução |
            | Desktop     | 1920x1080 |
            | Tablet      | 768x1024  |
            | Mobile      | 375x667   |

            Cenário: Performance do carregamento
            Dado que o usuário tem conexão de internet estável
            Quando acessa a página inicial
            Então a seção de recomendações carrega em menos de 2 segundos
            E as imagens são exibidas sem falhas

            Cenário: Acessibilidade
            Dado que o usuário utiliza leitor de tela
            Quando navega pela seção de recomendações
            Então cada filme tem:
            | Elemento | Atributo acessível           |
            | Capa     | Texto alternativo descritivo |
            | Título   | Nível de heading apropriado  |
            | Botões   | Rótulos ARIA                 |

Cenário: Localização dos dados
Dado que o sistema precisa atualizar as recomendações
Quando consulta a fonte de dados
Então verifica que os dados vêm da API oficial do IMDb
E são validados contra fontes secundárias confiáveis

Cenário: Ordenação das recomendações
Dado que múltiplos filmes atendem aos critérios
Quando a lista é montada
Então os filmes são ordenados por:
1. Maior popularidade
2. Melhor avaliação
3. Lançamento mais recente

Cenário: Comportamento com menos de 4 filmes válidos
Dado que apenas 3 filmes atendem aos critérios de recomendação
Quando o sistema gera a lista
Então exibe apenas os 3 filmes qualificados
E registra um alerta para análise da equipe de conteúdo