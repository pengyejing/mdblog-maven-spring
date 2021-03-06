<p align="center">
  <img src="https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/logo.png?raw=true" alt="Y"/>
</p>

基于spring-maven的简易轻量级`Markdown`个人博客平台。[这里](http://139.199.209.106/springmdblog/pad.do)是基于该平台搭建的博客。

##一、快速开始


##二、博客基本功能
该平台目标是越易使用，越简单越好。因此在这里阐述在部署好的情况下，如何快速使用该博客平台。
### 1.*显示文章*
在pad页面中，显示了所有博客文章，点击其中的博客文章链接，即可显示。

### 2.*添加文章*
添加新的文章，实际上是将博客文章内容写在本地的.md文件中，并将文件上传到服务器即可。只要将博客文章保存在一个博客文件夹中，并且需要让这两者名字相同。

### 3.*删除文章*
进入dir页面，该页面显示了平台管理的所有文件，将博客文章对应的目录删除即可。

### 4.*编辑文章*
没有浏览器在线编辑功能，若有需要编辑文章的情形，需要将文章下载下来并在本地做编辑，最后再上传覆盖原始文件。

### 5.*下载文章*
进入download页面，点击需要下载的文件即可直接下载。

##三、页面
目前支持以下6种页面。
### 1.*主页*
这类似于一个导航页面，在该页面可以转到其他页面例如 博客文章列表，目前暂时不支持博客文章的分类。
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/home.png)

### 2.*登录*
未登录的用户的权限是受限的，不能够上传、删除、下载以及打开后台目录。只有在登陆后才具备所有的权限。需要注意的是，主页中并没有给出登录的按钮，而是在`需要登录`的时候，自动跳出登录界面。此时用户再输入进行登录。
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/login.png)

### 3.*目录*
为了更好的管理平台中的内容，平台提供了简易的文件管理，管理的范围限制在了blogRoot文件夹中了，这是因为只有这个目录允许和用户交互。<br>
* 点击`..`可以回到上级目录，若已经是blogRoot目录，则继续显示当前目录。
* 点击`[DIR] ...`，可以进入到对应的目录中。
* 点击`[FIL] ...`，可以下载对应的文件。
* 点击删除链接，将会发送删除请求，以删除对应的文件或文件夹。需要注意的是，文件夹并不会直接删除，而是需要输入url来进行删除。
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/dir.png)

### 4.*上传*
文件上传的页面，可以上传任意文件。发送上传请求时，需要指定将文章上传到的路径。<br>
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/upload.png)

### 5.*文章*
博客文章的显示页面，在pad页面中点击对应的文章将会显示出来该博客内容。当然，该博客页面是由markdown转换到html再发送到浏览器中的。
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/article.png)

### 6.*等待*
博客文章的等待页面，在登录后会跳转到该页面以提示登录操作的成功与否，会显示进一步跳转的倒计时，也可以人为点击链接跳转。进一步跳转的目标链接由触发登录页面的操作决定。若是因为欲访问目录而触发的登录页面，那么登录完成后会显示目录。若是因为欲上传文件而触发的登录页面，那么登录完成后会显示上传页面。若登录失败，那么将跳转到登录页面以进行进一步登录。
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/wait.png)

##四、规则
要全面的使用该平台，需要遵守以下规则。
### 1.*上传*
虽然这是个markdown博客平台，但是并非仅仅只能上传markdown文件，该平台可以上传任意文件。若该文件已经存在，则会新的文件会覆盖旧的文件。所有的文件都存放在blogRoot目录下的，并且用户可以通过斜杠"/"将文件保存在深层次的目录结构中。

### 2.*博客文件夹*
前面提到了该平台可以上传任何文件，但是在pad页面中只会显示博客文件夹。`博客文件夹是在blogRoot目录下，以.md结尾的文件夹。`一个博客文件夹下面应该保存对应博客所需要的所有相关文件，例如使用到的照片和markdown。博客文章的内容写在markdown文件中，博客文件夹需要以该markdown文件命名。虽然照片是可以任意放置，再通过超链接引用，但是这种发散性的文件放置方式不便于管理，因此强烈建议将一个博客文章的所有相关内容放在该博客文件夹下。例如博客内容存放在了A.md文件中，并且其中使用了不B.jpg和C.jpg文件，这些文件应该上传到服务器blogRoot目录下的`A.md目录`中，在pad里将会多一个博客文章`A`，并且点击该文章会显示出来博客内容。

### 3.*目录删除*
目录删除是需要谨慎进行的，为了避免误操作造成较大损失，用户确认要进行删除时需要点击目录文件旁边的删除链接，此时会弹出真正进行删除的uri请求，复制该请求到网址中再回车即可。

### 4.*资源路径*
博客中当需要用到一个资源的时候，需要注意写清楚该资源的路径。
* 资源来自于博客服务器外
	需要写明其资源路径的url，例如使用来自github网站的图片资源:`https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/logo.png?raw=true`.
* 资源来自于博客服务器内
	通过上传功能，可以将图片等资源放置在博客服务器内部，并且放置于服务器的博客服务路径下的blogRoot文件夹中，因此服务器内部资源总会以`/springmdblog/blogRoot/`开头。后面在写明来自于哪个文件下的哪个文件。例如引用jscpp.md文件夹下的jscpp.jpg，使用路径:`/mdblog/blogRoot/jscpp.md/jscpp.jpg`

##五、配置
位于WEB-INFO/的conf.json，是博客平台的配置文件，该版本仅支持json的配置文件。

###1.*用户配置*
该项主要用于配置管理员账号和密码，在登录页面中使用。
```json
"username":"root",
"password":"root123"
```
username是用户名，password是密码。

###2.*重定向配置*
重定向页面的使用会传入一些参数，但若需要的参数没有传入的时候，会使用默认的值，这里就是配置默认值的。需要强调的是，这个配置一般不用碰，甚至用户根本不需要知道改页面的实现机制，只有二次开发的时候，若需要对操作进行一些重定向操作的时候，才需要使用。参数保持默认值即可。
```json
"redirect":
{
	"info"		: "无信息",
	"to"		: "/springmdblog/pad",
	"seconds"	: "3"
}
```

###3.*导航栏配置*
导航栏位于页面顶端的位置，所有的页面都会显示该导航栏，如下所示：
![](https://github.com/lsj9383/mdblog-maven-spring/blob/master/icon/nav.png)
导航栏最左边的只是一个当前页面的提示，右边是可以导航的位置，每个导航由一个名字和一个url组成，并且配置在buttons对象下。如下是一个配置的demo
```json
"buttons":
[
	{"name":"主页"		, "url":"/springmdblog/pad"},
	{"name":"目录"		, "url":"/springmdblog/dir?dir=/"},
	{"name":"上传"		, "url":"/springmdblog/uploadview.jsp"},
	{"name":"关于我"	, "url":"/springmdblog/md?md=Me"},
	{"name":"Github"	, "url":"https://github.com/lsj9383"}
]
```
buttons中是一个数组，每个元素都是一个对象，该对象反应了导航的名称和目标的位置。需要注意的是，**主页**、**目录**、**上传**这3个导航元素的name和url都说固定的，不过其排列顺序可以更换。排列顺序的更换会反应在导航栏的排列中。
###4.*配置demo*
下面展示一个配置的实例:
```json
{
	"username":"root",
	"password":"root123",
	"redirect":
	{
		"info"		: "无信息",
		"to"		: "/mdblog/pad",
		"seconds"	: "3"
	},
	"buttons":
	[
		{"name":"主页"	, "url":"/springmdblog/pad"},
		{"name":"目录"	, "url":"/springmdblog/dir?dir=/"},
		{"name":"上传"	, "url":"/springmdblog/uploadview.jsp"},
		{"name":"关于我"	, "url":"/mdblog/md?md=Me"},
		{"name":"Github", "url":"https://github.com/lsj9383"}
	]
}
```