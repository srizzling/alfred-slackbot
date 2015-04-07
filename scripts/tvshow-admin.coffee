
module.exports = (robot) ->
	robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
		room   = req.params.room
		data   = if req.body.payload? then JSON.parse req.body.payload else req.body
		tvshows = data.tvshows
		robot.brain.set 'tvshows', #{tvshows}
     	res.send 'TVShows Value Set'


     robot.respond /list tvshows/i, (res) ->
     	tvshows = robot.brain.get('tvshows')
     	msg.reply 'Current tv shows #{tvshows}