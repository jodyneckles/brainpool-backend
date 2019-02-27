# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jody = User.create(username: 'admin', password: 'admin', admin: true, avatar: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Guy_Fieri_at_Guantanamo_2.jpg')
graphicsWorkspace = Workspace.create(name: "graphics")
ingestWorkspace = Workspace.create(name: "ingest")
softwareDevelopmentWorkspace = Workspace.create(name: "software developement")
editorialWorkspace = Workspace.create(name: "editorial")
transmissionWorkspace = Workspace.create(name: "transmission")
mcrWorkspace = Workspace.create(name: "mcr")
soundWorkspace = Workspace.create(name: "sound")
cameraWorkspace = Workspace.create(name: "camera")
makeUpWorkspace = Workspace.create(name: "makeUp")
humanResourcesWorkspace = Workspace.create(name: "human resources")
socialMediaWorkspace = Workspace.create(name: "social media")
webWorkspace = Workspace.create(name: "web")
inputDeskWorkspace = Workspace.create(name: "input desk")
technicalOperatorsWorkspace = Workspace.create(name: "technical operators")
engineeringWorkspace = Workspace.create(name: "engineering")
introToGraphicsTheme = Theme.create(name: "introduction to the graphics department", workspace_id: 1)
introToIngestTheme = Theme.create(name: "introduction to the ingest department", workspace_id: 1)
loginToWorkstationNugget = Nugget.create(title: 'Login to a workstation', img_url: 'http://www.fixedbyvonnie.com/wp-content/uploads/2014/07/fixedbyvonnie-mac-os-x-login-screen.png', video_url: '<iframe width="560" height="315" src="https://www.youtube.com/embed/RqnqfOzohPY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', question: 'how to login to a graphics workstation?', body: 'this is a full body description about how to login to a graphics workstation. It can include markdown text, images, video', theme_id: 1)
loginToDropboxNugget = Nugget.create(title: 'Login to Dropbox', img_url: 'https://www.j2store.org/images/extensions/apps/apps_preview_image/dropbox_preview.png', video_url: '<iframe width="560" height="315" src="https://www.youtube.com/embed/OL52PIBSYb0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', question: 'how to login to a graphics workstation?', body: 'this is a full body description about how to login to a graphics workstation. It can include markdown text, images, video', theme_id: 1)
# User.first.update(workspaces: [Workspace.first], themes: [Theme.first], nuggets: [Nugget.first])
User.first.update(workspaces: [Workspace.first, Workspace.second, Workspace.third, Workspace.fourth, Workspace.fifth])
Workspace.first.update(themes: [Theme.first, Theme.second])
Theme.first.update(nuggets: [Nugget.first, Nugget.second])


