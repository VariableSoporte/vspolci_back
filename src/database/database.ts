import mysql2, { ConnectionOptions, QueryResult, ResultSetHeader, RowDataPacket } from 'mysql2/promise';
import dotenv from "dotenv";
dotenv.config();

const config: ConnectionOptions = {
    host: process.env.HOST ,
    user: process.env.USER ,
    password: process.env.PASSWORD ,
    database: process.env.BD ,
    connectionLimit: 10,
    waitForConnections: true,
    queueLimit: 0
}

const pool = mysql2.createPool(config);

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