module ShowHelper
  def toggle_text(user_watch)
    if user_watch.watched
      "I haven't seen it"
    else
      "I've seen it"
    end
  end

  def watched_status_class(user_watch)
    if user_watch.watched
      "watched"
    else
      "unwatched"
    end
  end
end
