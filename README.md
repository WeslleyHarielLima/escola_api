# API da Matricula de Usuario

API REST para gerenciamento do sistema, utilizada pelo frontend Next.js. Autenticação via JWT, endpoints protegidos e CRUD completo.

# Índice

Tecnologias

Pré-requisitos

Instalação

Configuração

Estrutura do Projeto

Endpoints

Autenticação

Exemplos de Requisição

Contribuição

Licença

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

# Instalação
# Clone o repositório
git clone https://github.com/seu-usuario/nome-da-api.git

# Acesse o diretório
cd nome-da-api

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

# Endpoints
Autenticação
Método	Rota	Descrição
POST	/auth/login	Login do usuário, retorna JWT
POST	/auth/logout	Logout (opcional)
POST	/auth/register	Cria novo usuário

Usuários
Método	Rota	Descrição
GET	/users	Lista todos os usuários
GET	/users/:id	Busca usuário por ID
POST	/users	Cria novo usuário
PUT	/users/:id	Atualiza usuário
DELETE	/users/:id	Remove usuário
Outros Endpoints

/cursos – CRUD de cursos

/alunos – CRUD de alunos

/escolas – CRUD de escolas

Adapte conforme entidades do seu projeto.

# Autenticação

JWT é gerado no login e enviado para o frontend.

Endpoints protegidos devem receber o token no header Authorization: Bearer <TOKEN>.

Exemplo de middleware:

import jwt from 'jsonwebtoken'

export function authMiddleware(req, res, next) {
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]

  if (!token) return res.status(401).json({ message: 'Token não fornecido' })

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.status(403).json({ message: 'Token inválido' })
    req.user = user
    next()
  })
}

# Exemplos de Requisição
Login
POST /auth/login
Content-Type: application/json

{
  "email": "usuario@exemplo.com",
  "password": "senha123"
}


Resposta:

{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}

Criar Usuário
POST /users
Authorization: Bearer <TOKEN>
Content-Type: application/json

{
  "name": "João",
  "email": "joao@exemplo.com",
  "password": "senha123"
}

# Contribuição

Fork este repositório

Crie uma branch: git checkout -b feature/nova-funcionalidade

Faça suas alterações e commit: git commit -m 'Adiciona nova funcionalidade'

Push para a branch: git push origin feature/nova-funcionalidade

Abra um Pull Request
