const Sequelize = require("sequelize");

const sequelize = new Sequelize(
  process.env.DB_NAME || "qirawywi",
  process.env.DB_USER || "qirawywi",
  process.env.DB_PASSWORD || "jV9wLDvzBeQt5vIP-DMODjEscAbkgbiR",
  {
    host: process.env.DB_HOST || "baasu.db.elephantsql.com",
    port: parseInt(process.env.DB_PORT) || 5432,
    dialect: "postgres",
    pool: {
      max: 10,
      min: 0,
      idle: 30000
    },
    define: {
      timestamps: false
    }
  }
);

module.exports = sequelize;
