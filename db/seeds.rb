15.times do |n|
  width = rand(10..14)
  height = rand(10..14)
  mines = rand(3..12)
  puts "n: #{n + 1} | width: #{width} | height: #{height} | mines: #{mines} |"
  Board.create!(name: "Mines #{n + 1}", email: "user#{n + 1}@mail.com", width: width, height: height, mines: mines)
end
