# write some jbuilder to return some json about a board
# it should include the board
#  - its lists
#    - the cards for each list
# json.array!(@boord.lists) do |list|
#   json.partial!("list", )
# end
json.(@board, :title, :user_id, :updated_at)

json.lists @board.lists do |list|
  json.title list.title
  json.ord list.ord
  json.board_id list.board_id
  json.list_id list.id

  json.cards list.cards do |card|
    json.title card.title
    json.description card.description
    json.ord card.ord
    json.list_id card.list_id
    json.card_id card.id
  end

end
