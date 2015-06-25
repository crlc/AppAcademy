json.boards @boards do |board|
  json.id board.id
  json.title board.title
  json.pushed_at board.pushed_at
end
