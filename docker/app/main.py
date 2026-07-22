import os
import psycopg2

def main():
    conn = psycopg2.connect(
        host=os.getenv("POSTGRES_HOST", "postgres"),
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD"),
        dbname=os.getenv("POSTGRES_DB"),
    )
    cur = conn.cursor()
    cur.execute(
        "CREATE TABLE IF NOT EXISTS heartbeat ("
        "id SERIAL PRIMARY KEY, "
        "created_at TIMESTAMP DEFAULT NOW());"
    )
    cur.execute("INSERT INTO heartbeat DEFAULT VALUES;")
    conn.commit()
    cur.execute("SELECT COUNT(*) FROM heartbeat;")
    print(f"Rows in heartbeat: {cur.fetchone()[0]}")
    cur.close()
    conn.close()

if __name__ == "__main__":
    main()