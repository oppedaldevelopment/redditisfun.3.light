-- local aliases for globals
local TEXT_SIZE_LARGE = redditisfun.TEXT_SIZE_LARGE
local TEXT_SIZE_MEDIUM = redditisfun.TEXT_SIZE_MEDIUM
local TEXT_SIZE_SMALL = redditisfun.TEXT_SIZE_SMALL

local TEXT_COLOR_SECONDARY     = redditisfun.TEXT_COLOR_SECONDARY
local TEXT_COLOR_SUBMITTER     = "#888888"
local TEXT_COLOR_OP            = "#ff0000ff"
local TEXT_COLOR_MODERATOR     = "#ff228822"
local TEXT_COLOR_ADMIN         = "#ffff0011"
local TEXT_COLOR_SPECIAL_ADMIN = "#BE1337"

local TEXT_SIZE_BODY = TEXT_SIZE_SMALL * 1.1

-- http://colllor.com/33b5e5
local CHECKED_BGCOLOR = "#DBF2FA"

local ACTIONBAR_ITEM_BACKGROUND = redditisfun.ACTIONBAR_ITEM_BACKGROUND
local Fonts = redditisfun.Fonts
local Toasts = redditisfun.Toasts

---
-- @usage exported
function newView(Builder)
	local view1 = Builder:beginLinearLayout("root_container")
	view1:setLayoutSize("fill_parent", "wrap_content")
	view1:setOrientation("horizontal")
	view1:setOnClick("onListItemClick")
	view1:setBackground(ACTIONBAR_ITEM_BACKGROUND)
		local function addIndent(viewId)
			local left_indent = Builder:addView(viewId)
			left_indent:setLayoutSize("1dp", "fill_parent")
			left_indent:setLayoutMarginLeft("5dp")
			left_indent:setLayoutMarginRight("4dp")
			left_indent:setBackground("#ffdfdfdf")
		end
		
		addIndent("left_indent1")
		addIndent("left_indent2")
		addIndent("left_indent3")
		addIndent("left_indent4")
		addIndent("left_indent5")
		addIndent("left_indent6")
		addIndent("left_indent7")
		addIndent("left_indent8")

	    local view2 = Builder:beginLinearLayout("view2")
	    view2:setLayoutSize("0dp", "wrap_content")
	    view2:setLayoutWeight(1.000000)
	    view2:setOrientation("vertical")
	    view2:setPadding("5dp", "8dp", "5dp", "8dp")
	
	        local comment_nav = Builder:beginLinearLayout("comment_nav")
	        comment_nav:setLayoutSize("wrap_content", "wrap_content")
	        comment_nav:setOrientation("horizontal")
	        comment_nav:setGravity("center")
	            local close_comment = Builder:addButtonSmall("close_comment")
	            close_comment:setLayoutSize("wrap_content", "wrap_content")
	            close_comment:setOnClick("closeComment")
	            close_comment:setText("done")
	            local hide_comment = Builder:addButtonSmall("hide_comment")
	            hide_comment:setLayoutSize("wrap_content", "wrap_content")
	            hide_comment:setOnClick("hideComment")
	            hide_comment:setText("hide")
	            local view6 = Builder:addView("view6")
	            view6:setLayoutSize("0dp", "wrap_content")
	            view6:setLayoutWeight(1.000000)
	            local prev = Builder:addButtonSmall("prev")
	            prev:setLayoutSize("wrap_content", "wrap_content")
	            prev:setOnClick("prevComment")
	            prev:setText("▲ prev")
	            local next = Builder:addButtonSmall("next")
	            next:setLayoutSize("wrap_content", "wrap_content")
	            next:setOnClick("nextComment")
	            next:setText("next ▼")
	            local root = Builder:addButtonSmall("root")
	            root:setLayoutSize("wrap_content", "wrap_content")
	            root:setOnClick("rootComment")
	            root:setText("▲ root")
	            local full_comments = Builder:addButtonSmall("full_comments")
	            full_comments:setLayoutSize("wrap_content", "wrap_content")
	            full_comments:setOnClick("fullComments")
	            full_comments:setText("▲ full")
	            local parent = Builder:addButtonSmall("parent")
	            parent:setLayoutSize("wrap_content", "wrap_content")
	            parent:setOnClick("parentComment")
	            parent:setText("▲ parent")
	        Builder:endViewGroup()
	
	        local view12 = Builder:beginLinearLayout("view12")
	        view12:setLayoutSize("wrap_content", "wrap_content")
	        view12:setOrientation("horizontal")
	
	            local view13 = Builder:beginFrameLayout("view13")
	            view13:setLayoutSize("wrap_content", "wrap_content")
	            view13:setLayoutGravity("center")
	                local vote_up_comment_image = Builder:addImageView("vote_up_comment_image")
	                vote_up_comment_image:setLayoutSize("13dip", "8dip")
	                vote_up_comment_image:setPaddingRight("5dip")
	                vote_up_comment_image:setVisibility("gone")
	                vote_up_comment_image:setDrawable("vote_up_comment_red.png")
	                -- FIXME: replace reference "@string/vote_up_arrow_content_description" with value
	                vote_up_comment_image:setContentDescription("@string/vote_up_arrow_content_description")
	                vote_up_comment_image:setScaleType("fitCenter")
	                local vote_down_comment_image = Builder:addImageView("vote_down_comment_image")
	                vote_down_comment_image:setLayoutSize("13dip", "8dip")
	                vote_down_comment_image:setPaddingRight("5dip")
	                vote_down_comment_image:setVisibility("gone")
	                vote_down_comment_image:setDrawable("vote_down_comment_blue.png")
	                -- FIXME: replace reference "@string/vote_down_arrow_content_description" with value
	                vote_down_comment_image:setContentDescription("@string/vote_down_arrow_content_description")
	                vote_down_comment_image:setScaleType("fitCenter")
	            Builder:endViewGroup()
	
	            local submitter = Builder:addTextView("submitter")
	            submitter:setLayoutSize("wrap_content", "wrap_content")
	            submitter:setLayoutMarginRight("5dip")
	            submitter:setTextSize(TEXT_SIZE_SMALL)
	            submitter:setTextColor(TEXT_COLOR_SUBMITTER)
	            submitter:setTextStyle("bold")
	            submitter:setSingleLine()
	            submitter:setEllipsize("marquee")
                local submitter_distinguished_op = Builder:addTextView("submitter_distinguished_op")
                submitter_distinguished_op:setLayoutSize("wrap_content", "wrap_content")
                submitter_distinguished_op:setLayoutMarginRight("5dip")
                submitter_distinguished_op:setVisibility("gone")
                submitter_distinguished_op:setText("[S]")
                submitter_distinguished_op:setTextSize(TEXT_SIZE_SMALL)
                submitter_distinguished_op:setTextColor(TEXT_COLOR_OP)
                submitter_distinguished_op:setSingleLine(true)
                local submitter_distinguished_mod = Builder:addTextView("submitter_distinguished_mod")
                submitter_distinguished_mod:setLayoutSize("wrap_content", "wrap_content")
                submitter_distinguished_mod:setLayoutMarginRight("5dip")
                submitter_distinguished_mod:setVisibility("gone")
                submitter_distinguished_mod:setText("[M]")
                submitter_distinguished_mod:setTextSize(TEXT_SIZE_SMALL)
                submitter_distinguished_mod:setTextColor(TEXT_COLOR_MODERATOR)
                submitter_distinguished_mod:setSingleLine(true)
                local submitter_distinguished_admin = Builder:addTextView("submitter_distinguished_admin")
                submitter_distinguished_admin:setLayoutSize("wrap_content", "wrap_content")
                submitter_distinguished_admin:setLayoutMarginRight("5dip")
                submitter_distinguished_admin:setVisibility("gone")
                submitter_distinguished_admin:setText("[A]")
                submitter_distinguished_admin:setTextSize(TEXT_SIZE_SMALL)
                submitter_distinguished_admin:setTextColor(TEXT_COLOR_ADMIN)
                submitter_distinguished_admin:setSingleLine(true)
                local submitter_distinguished_special = Builder:addTextView("submitter_distinguished_special")
                submitter_distinguished_special:setLayoutSize("wrap_content", "wrap_content")
                submitter_distinguished_special:setLayoutMarginRight("5dip")
                submitter_distinguished_special:setVisibility("gone")
                submitter_distinguished_special:setText("[Δ]")
                submitter_distinguished_special:setTextSize(TEXT_SIZE_SMALL)
                submitter_distinguished_special:setTextColor(TEXT_COLOR_SPECIAL_ADMIN)
                submitter_distinguished_special:setSingleLine(true)
	
	            local view17 = Builder:beginLinearLayout("view17")
	            view17:setLayoutSize("wrap_content", "wrap_content")
	            view17:setOrientation("horizontal")
	                local flair = Builder:addTextView("flair")
	                flair:setLayoutSize("0dp", "wrap_content")
	                flair:setLayoutWeight(1.000000)
	                flair:setLayoutMarginRight("5dip")
	                flair:setVisibility("gone")
	                flair:setTextSize(TEXT_SIZE_SMALL)
	                flair:setTextColor(TEXT_COLOR_SECONDARY)
	                flair:setSingleLine()
	                local num_points = Builder:addTextView("num_points")
	                num_points:setLayoutSize("wrap_content", "wrap_content")
	                num_points:setLayoutMarginRight("4dip")
	                num_points:setTextSize(TEXT_SIZE_SMALL)
	                num_points:setTextColor(TEXT_COLOR_SECONDARY)
	                num_points:setSingleLine()
	                num_points:setEllipsize("marquee")
	                local submission_time = Builder:addTextView("submission_time")
	                submission_time:setLayoutSize("wrap_content", "wrap_content")
	                submission_time:setLayoutMarginRight("4dip")
	                submission_time:setTextSize(TEXT_SIZE_SMALL)
	                submission_time:setTextColor(TEXT_COLOR_SECONDARY)
	                submission_time:setSingleLine()
	                submission_time:setEllipsize("marquee")
	                local comment_gild = Builder:addImageView("comment_gild")
	                comment_gild:setLayoutSize("13dp", "14dp")
	                comment_gild:setLayoutGravity("center")
	                comment_gild:setScaleType("fitXY")
	                comment_gild:setDrawable("comment_gild.png")
	            Builder:endViewGroup()
	
	        Builder:endViewGroup()
	
	        local moderator_notes = Builder:addTextView("moderator_notes")
	        moderator_notes:setLayoutSize("wrap_content", "wrap_content")
	        moderator_notes:setVisibility("gone")
	        moderator_notes:setTextSize(TEXT_SIZE_SMALL)
	        moderator_notes:setTextColor(TEXT_COLOR_SECONDARY)
	        moderator_notes:setTextColor("#ffF88017")
	        moderator_notes:setSingleLine()
	        local body = Builder:addTextView("body")
	        body:setLayoutSize("fill_parent", "wrap_content")
	        body:setLayoutMarginRight("5dip")
	        body:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	        body:setOnClick("onListItemClick")
	        body:setClickable(true)
	        body:setTextSize(TEXT_SIZE_BODY)
	        body:setTextColor("#000000")
	        body:setLinksClickable(true)
	
	        local comment_actions = Builder:beginLinearLayout("comment_actions")
	        comment_actions:setLayoutSize("fill_parent", "wrap_content")
	        comment_actions:setLayoutMarginTop("5dp")
	        comment_actions:setOrientation("horizontal")
	        comment_actions:setVisibility("gone")
	        comment_actions:setGravity("center")
	            local vote_up_button = Builder:addImageButton("vote_up_button")
	            vote_up_button:setLayoutSize("0dp", "32dp")
	            vote_up_button:setLayoutWeight(1.000000)
	            vote_up_button:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	            vote_up_button:setOnClick("voteUp")
	            vote_up_button:setOnLongClick(function(v) Toasts:showHintShort("Upvote", v) end)
	            vote_up_button:setDrawable("up_arrow_holo_light.png")
	            vote_up_button:setScaleType("fitCenter")
	            local vote_down_button = Builder:addImageButton("vote_down_button")
	            vote_down_button:setLayoutSize("0dp", "32dp")
	            vote_down_button:setLayoutWeight(1.000000)
	            vote_down_button:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	            vote_down_button:setOnClick("voteDown")
	            vote_down_button:setOnLongClick(function(v) Toasts:showHintShort("Downvote", v) end)
	            vote_down_button:setDrawable("down_arrow_holo_light.png")
	            vote_down_button:setScaleType("fitCenter")
	            local more_actions = Builder:addImageButton("more_actions")
	            more_actions:setLayoutSize("0dp", "32dp")
	            more_actions:setLayoutWeight(1.000000)
	            more_actions:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	            more_actions:setOnClick("moreActionsComment")
	            more_actions:setOnLongClick(function(v) Toasts:showHintShort("More actions", v) end)
	            more_actions:setDrawable("ic_menu_moreoverflow_normal_holo_light.png")
	            more_actions:setScaleType("fitCenter")
	            local permalink = Builder:addImageButton("permalink")
	            permalink:setLayoutSize("0dp", "32dp")
	            permalink:setLayoutWeight(1.000000)
	            permalink:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	            permalink:setOnClick("permalinkComment")
	            permalink:setOnLongClick(function(v) Toasts:showHintShort("Permalink", v) end)
	            permalink:setDrawable("ic_menu_share_plain_holo_light.png")
	            permalink:setScaleType("fitCenter")
	            local reply = Builder:addImageButton("reply")
	            reply:setLayoutSize("0dp", "32dp")
	            reply:setLayoutWeight(1.000000)
	            reply:setBackground(ACTIONBAR_ITEM_BACKGROUND)
	            reply:setOnClick("reply")
	            reply:setOnLongClick(function(v) Toasts:showHintShort("Reply", v) end)
	            reply:setDrawable("social_reply_holo_light.png")
	            reply:setScaleType("fitCenter")
	        Builder:endViewGroup()
	
	    Builder:endViewGroup()
	
	Builder:endViewGroup()
	
	Fonts:registerNormal("Roboto", "fonts/Roboto-Regular.ttf")
	Fonts:registerBold("Roboto", "fonts/Roboto-Bold.ttf")
	Fonts:registerItalic("Roboto", "fonts/Roboto-Italic.ttf")
	Fonts:registerBoldItalic("Roboto", "fonts/Roboto-BoldItalic.ttf")
	view1:setTypeface("Roboto")
	
end

---
-- @usage exported
function bindView(Holder, Thing, ListItem)
	local rootContainer = Holder:getView("root_container")
	rootContainer:setBackground(ListItem:isChecked() and CHECKED_BGCOLOR or ACTIONBAR_ITEM_BACKGROUND)
	rootContainer:setClickable(not ListItem:isChecked())
	
	local voteUpButton = Holder:getView("vote_up_button")
	local voteDownButton = Holder:getView("vote_down_button")
	voteUpButton:setDrawable(Thing:getLikes()==true and "up_arrow_red.png" or "up_arrow_holo_light.png")
	voteDownButton:setDrawable(Thing:getLikes()==false and "down_arrow_blue.png" or "down_arrow_holo_light.png")

	local next = Holder:getView("next")
	local prev = Holder:getView("prev")
	local parent = Holder:getView("parent")

	-- set click data for clickable elements that delegate to Java
	rootContainer:setClickData(Thing)
	Holder:getView("body"):setClickData(Thing)
	Holder:getView("hide_comment"):setClickData(Thing)
	next:setClickData(Thing)
	prev:setClickData(Thing)
	parent:setClickData(Thing)
	Holder:getView("root"):setClickData(Thing)
	Holder:getView("full_comments"):setClickData(Thing)
	Holder:getView("reply"):setClickData(Thing)
	Holder:getView("more_actions"):setClickData(Thing)
	Holder:getView("permalink"):setClickData(Thing)
	voteUpButton:setClickData(Thing)
	voteDownButton:setClickData(Thing)
	
	-- indentation
	for i = 1,8 do
	    Holder:getView("left_indent" .. i):setVisible(Thing:getNestingLevel() >= i)
	end
	
	Holder:getView("comment_nav"):setVisible(ListItem:isChecked())
	Holder:getView("comment_actions"):setVisible(ListItem:isChecked())
	
	-- nav buttons
	local linkToFullComments = Thing:isLinkToFullComments()
	next:setVisible(Thing:getNestingLevel() == 0 and not linkToFullComments)
	prev:setVisible(Thing:getNestingLevel() == 0 and not linkToFullComments)
	prev:setEnabled(ListItem:getPosition() > 1)
	parent:setVisible(Thing:getNestingLevel() ~= 0 or linkToFullComments)
	parent:setEnabled(Thing:getParent_id():sub(1, 2) == "t1")  -- enable link to parent, if parent is a comment
	Holder:getView("root"):setVisible(Thing:getNestingLevel() ~= 0)
	Holder:getView("full_comments"):setVisible(linkToFullComments)
	
	--
	-- comment info
	--
	if Thing:isDeleted() or Thing:getLikes() == nil then
		Holder:getView("vote_up_comment_image"):setVisibility("gone")
		Holder:getView("vote_down_comment_image"):setVisibility("gone")
	elseif Thing:getLikes() == true then
		Holder:getView("vote_up_comment_image"):setVisibility("visible")
		Holder:getView("vote_down_comment_image"):setVisibility("gone")
	else --if Thing:getLikes() == false then
		Holder:getView("vote_up_comment_image"):setVisibility("gone")
		Holder:getView("vote_down_comment_image"):setVisibility("visible")
	end
	
	local submitter = Holder:getView("submitter")
	submitter:setText(Thing:getAuthor())
	if Thing:isOp() then
		submitter:setTextColor(TEXT_COLOR_OP)
	elseif Thing:isModerator() then
		submitter:setTextColor(TEXT_COLOR_MODERATOR)
	elseif Thing:isAdmin() then
		submitter:setTextColor(TEXT_COLOR_ADMIN)
	elseif Thing:isSpecialAdmin() then
		submitter:setTextColor(TEXT_COLOR_SPECIAL_ADMIN)
	else
		submitter:setTextColor(TEXT_COLOR_SUBMITTER)
	end
	Holder:getView("submitter_distinguished_op"):setVisible(Thing:isOp())
	Holder:getView("submitter_distinguished_mod"):setVisible(Thing:isModerator())
	Holder:getView("submitter_distinguished_admin"):setVisible(Thing:isAdmin())
	Holder:getView("submitter_distinguished_special"):setVisible(Thing:isSpecialAdmin())
	
		
	local score = Thing:getUps() - Thing:getDowns()
	Holder:getView("num_points"):setText(string.format(score==1 and "%d point" or "%d points", score))
	Holder:getView("submission_time"):setText(Thing:getCreatedTimeAgo())
	Holder:getView("comment_gild"):setVisible(Thing:getGilded() > 0)

	local body = Holder:getView("body")
	if Thing:getRenderedBody() then
		-- TODO catch ArrayIndexOutOfBoundsException
		-- JellyBean bug http://code.google.com/p/android/issues/detail?id=34872
		body:setText(Thing:getRenderedBody())
	else
		body:setText(Thing:getBody())
	end
	body:setMovementMethod("LinkMovementMethod")
	body:setClickable(not ListItem:isChecked())
	body:setLongClickable(false)
end