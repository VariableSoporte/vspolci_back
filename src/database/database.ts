import mysql2, { ConnectionOptions, QueryResult, ResultSetHeader, RowDataPacket } from 'mysql2/promise';
import dotenv from "dotenv";
dotenv.config();

const config: ConnectionOptions = {
    host: process.env.DB_HOST ,
    user: process.env.DB_USER ,
    password: process.env.DB_PASSWORD ,
    database: process.env.DB_BD ,
    connectionLimit: 10,
    waitForConnections: true,
    queueLimit: 0
}

export const pool = mysql2.createPool(config);

class DataBase {
    async query <T extends RowDataPacket[] | ResultSetHeader > ( sql: string, values: any = null){
        const cn = await pool.getConnection();
        try {
            const [result] = await cn.query(sql, values);
            return result as T;
            
        } finally {
            cn.release();
        }
    }
}


export default new DataBase();