DATABASE = SQLite3::Database.new("/Users/usman/Code/2015-02-16-message-board/database/main.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS boards (id INTEGER PRIMARY KEY, title TEXT UNIQUE, thread_count INTEGER DEFAULT 0,
  post_count INTEGER DEFAULT 0, description TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT UNIQUE, total_posts INTEGER DEFAULT 0,
                              total_threads INTEGER DEFAULT 0)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS posts (id INTEGER PRIMARY KEY, message TEXT, thread_id INTEGER, user_id INTEGER,
                              FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
                              FOREIGN KEY(thread_id) REFERENCES threads(id) ON DELETE CASCADE)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS threads (id INTEGER PRIMARY KEY, title TEXT, user_id INTEGER, board_id INTEGER,
                              FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
                              FOREIGN KEY(board_id) REFERENCES boards(id) ON DELETE CASCADE)")
