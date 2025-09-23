# API da Matricula de Usuario

API REST para gerenciamento do sistema, utilizada pelo frontend Next.js. Autenticação via JWT, endpoints protegidos e CRUD completo.

# Tecnologias

Node.js / Express.js ou Rails (substituir conforme backend)

JWT (JSON Web Token)

PostgreSQL / MySQL / SQLite (ou banco utilizado)

Sequelize / Prisma / ActiveRecord (ORM, conforme backend)

Cors, dotenv

# Pré-requisitos

Node.js >= 18.x (ou Ruby >= 3.x se Rails)

Banco de dados configurado (PostgreSQL/MySQL)

npm ou yarn


# Instale as dependências
npm install
# ou
yarn install

Configuração

Crie um arquivo .env na raiz com as variáveis de ambiente:

DATABASE_URL=postgres://usuario:senha@localhost:5432/nome_do_banco
JWT_SECRET=seu_segredo_jwt
PORT=5000


Ajuste DATABASE_URL conforme seu banco.

# Estrutura do Projeto

Exemplo de estrutura:

src/
├─ controllers/       # Funções que controlam a lógica dos endpoints
├─ routes/            # Definição das rotas da API
├─ middlewares/       # Middleware de autenticação, logging etc
├─ models/            # Modelos do banco (ORM)
├─ services/          # Regras de negócio e integração com outros serviços
├─ utils/             # Funções utilitárias (ex: geração de token)
└─ app.js             # Arquivo principal

