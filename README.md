# README

Teste E-Inscrição - Jaison Renato Coelho

Aplicação desenvolvida em Ruby on Rails

* Para rodar localmente em ambiente unix, siga procedimentos abaixo.

  - Requisitos
    - Ruby versão 2.6.3
  
  - Database
    - SQLite
  
  - Intruções para Rodar
    - No diretório do projeto, execute:
      - bundle install
      - rake db:create
      - rake db:migrate
      - rails s
      - Tasks - Exemplos:
        - rake run:create["05-12-2019",2,"Jaison"]
        - rake run:check_availability["05-12-2019",2]
  
  - Para rodar testes
    - No diretório do projeto, execute:
      - rails test
