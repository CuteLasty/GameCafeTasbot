--Written by Brandon Evans

--You can change the number of controllers tracked here.
local controllers = 2
--You can change the position of the text here.
local x = 0
local y = 8

local frame_count = 0
local lag_num = 0

function counts()
	--Display the counts of the buttons pressed and inputted.
	gui.text(x, y, 'frame_count: ' .. frame_count)
	gui.text(x, y + 8, 'lag_num: ' .. lag_num)
end

while true do
	--If this is the first frame, reset the data.
	if emu.framecount() == 0 then
		lag_num = 0
	end
	frame_count=emu.framecount()
	gui.text(x, y + 0, 'frame_count : ' .. (frame_count))
	if emu.lagged() 
	then
			lag_num = lag_num + 1
			taseditor.setplayback(frame_count - 1 )
			taseditor.applyinputchanges()
			taseditor.submitinputchange(frame_count - 1, 1, 255)
			taseditor.applyinputchanges()
			emu.frameadvance()
			emu.frameadvance()
	else
		emu.frameadvance()
	end
	gui.text(x, y + 8, 'lag_deal : ' .. lag_num)
end