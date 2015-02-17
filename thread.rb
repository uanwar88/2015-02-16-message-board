class Thread
  @table_name = 'threads'
  extend MainModules, ExtraModules
  attr_accessor :id, :title, :user_id

  def initialize(options)
    @title = options['title']
    @user_id = options['user_id']
  end

  def insert
    DATABASE.execute("INSERT INTO threads (title, user_id) VALUES ('#{@title}', #{@user_id})")
  end

  def edit(options)
    @title = options['title']
  end

  def save_edits
    DATABASE.execute("UPDATE threads SET title = '#{@title}' WHERE id = #{@id}")
  end

  def list_board(id)
    DATABASE.execute("SELECT * FROM threads WHERE board_id = #{id}")
  end
end
