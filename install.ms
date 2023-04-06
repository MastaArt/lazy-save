/*
	Lasy Save
	by MastaMan
	Installer file
	
	https://3dground.net/
*/

struct Installer (
	mainScriptName = "Lazy Save.ms",	
	currScript = getThisScriptFileName(),
	pth = getFileNamePath this.currScript,
	mainScript = this.pth + this.mainScriptName,
	
	fn getSetting k s: "INFO" = (
        return getINISetting this.mainScript s k
	),
	
	cat = this.getSetting "CAT",
	macro1 = this.getSetting "MACRO1",
	macro2 = this.getSetting "MACRO2",
	
	fn addQuadMenuButton txt macro remove: false = (
		local quadMenu = menuMan.getViewportRightClickMenu #nonePressed
		local theMenu = quadMenu.getMenu 1
		
		fn findMenuItem theMenu menuName = (
			for i in 1 to theMenu.numItems() where (theMenu.getItem i).getTitle() == menuName do return i
			return 0
		)
		
		fn unregisterMenuItem theMenu menuName = (
			try (
				for i in 1 to theMenu.numItems() do (
					if((theMenu.getItem i).getTitle() == menuName) do (
						theMenu.removeItemByPosition i 
						
						if((theMenu.getItem (i - 1)).getIsSeparator()) do theMenu.removeItemByPosition (i - 1)
					)
				)
			) catch()
		)
		
		local item = try(findMenuItem theMenu "Select &Similar") catch (6)
		
		unregisterMenuItem theMenu txt
		
		if(not remove) do (
			quadItem = menuMan.createActionItem macro (this.cat)
			theMenu.addItem quadItem (item += 1)
		)
			
		menuMan.updateMenuBar()
	),
	
	fn setup = (
		if (not doesFileExist this.mainScript) do return messageBox (this.mainScript + " not found!\nPlease download script from GitHub and try again!") title: "Error!"
		
		n = "\n"
		ex = "macroScript " + this.macro1 + n
		ex += "category:\"" + this.cat + "\"" + n
		ex += "toolTip:\"[SAVE]\"" + n
		ex += "buttontext:\"[SAVE]\"" + n
		ex += "(" + n
		ex += "on execute do (" + n
		ex += "try(fileIn(@\"" + this.mainScript + "\");::LAZY_SAVE.save()) catch(messageBox \"Script not found! Please reinstall script!\" title: \"Warning!\")" + n
		ex += ")" + n
		ex += ")" + n
		
		execute ex
		
		n = "\n"
		ex = "macroScript " + this.macro2 + n
		ex += "category:\"" + this.cat + "\"" + n
		ex += "toolTip:\"[SAVE AS ]\"" + n
		ex += "buttontext:\"[SAVE AS]\"" + n
		ex += "(" + n
		ex += "on execute do (" + n
		ex += "try(fileIn(@\"" + this.mainScript + "\");::LAZY_SAVE.saveAs()) catch(messageBox \"Script not found! Please reinstall script!\" title: \"Warning!\")" + n
		ex += ")" + n
		ex += ")" + n
		
		execute ex
		
		this.addQuadMenuButton "[SAVE AS]" this.macro2
		this.addQuadMenuButton "[SAVE]" this.macro1
		
		m = "Lazy Save installed success!" + n
		m += "You can find it in " + this.cat + " category or Quad Menu."
		
		messageBox m title: "Installed" beep: false
	)
)

(Installer()).setup()