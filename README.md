# Project-NTV-SnakeGame-2023
<img src="assets/images/snake-logo.png">
<h1>Criteria</h1>
<h2>Turn-in instructions:</h2>
<p>
    This assessment must be turned in via Git at github.com
    Each solution must be in a separate file, within the same project.
    Please add pictures of final output.
</p>
<h3><strong>Minimum requirements: 80%</strong></h3>
<ol>
  <li>Git commit / Work constancy - 25%</li>
  <li>Program Correctness - 50%</li>
  <li>Readability: 20%</li>
  <li>Documentation: 15%</li>
  <li>Code Elegance: 15%</li>
  <li>Additional requirements: 20%</li>
  <h4>The pass grade for this assignment is 50%</h4>
</ol><hr>
<dl><h5>Additional requirements (20%) - Pick one</h5>
  <dt>Multiscreen application </dt>
  <dd>Add a nice looking Home screen that has a "Start Game" button - maybe summary for the rules of the game, or fun gif / design that gets the user excited to
  play. The game starts with randomly picked word / sentence from a list. To learn
  how to create multiscreen applications, check out BMI Calculator section of the
  Flutter course. It also covers some advanced UI design and code structuring!
</dd><hr>
  <dt>Input custom words / sentences</dt>
  <dd>Update the starting screen to allow the user to start the game by receiving a
  word / sentence randomly selected for him, or, they can input the word / sentence themselves. That would allow the user to input his own challenge for others to attempt.</dd><hr>
  <dt>Change difficulty</dt>
  <dd>Change the rules of the game, to allow the user to attempt to solve using easy, medium or hard mode. It’s up the the creator to implement those states - but they could include fewer errors allowed, hide some or all of the wrongly guessed characters or randomly remove successfully guessed character so they have to input it again. Dealers choice.</dd><hr>
  <dt>Hints</dt>
  <dd>Allow the user to get a hint of what the word is, at a cost of a failed guess attempt</dd><hr>
  <dt>Other</dt>
  <dd>Anything other that you might think of that would make the game more fun and engaging!</dd><hr>
</dl><br>
<h1>Features</h1>
<ol>
    <li>
        Main Menu<br>
        <img src="assets/images/screens/mainmenu-screen.png"><br>
        <p>The main menu screen is the first to greet the user where they can find a navigation bar that is easy to navigate and a logo on the opposite side with the currnet page name.</p>
    </li>
    <li>
        How To Play<br>
        <img src="assets/images/screens/how-to-play-screen.png"><br>
        <p>How to play is the another screen made with the intention to tell the user how to play with three sections, instructions that tells the user first a bit about the game. Gameplay will tell the player the concept of the game and last the Controls will let the player know how to move around. The navigation bar contains the Logo and what page the user is with a home button to return to the main menu.</p>
    </li>
    <li>
        Game<br>
        <img src="assets/images/screens/game-screen.png"><br>
        <p>Game screen is where the game is portrait and has a different color center so the player knows what is in play and what isn't, It includes a scoreboard. The Navigation contains a back button and the title of the page next to it.</p>
    </li>
    <li>
        Alert<br>
        <img src="assets/images/screens/alert.png"><br>
        <p>Alert will pop up whenever the user crashes into themselves or the grid. It will cast a shadow on the game and show you're score and let you choose to restart or return to the main menu. If the user clicks on the outside of the box it will disapare and you can use the back button to navigate back.</p>
    </li>
</ol>
<h1>Color Scheme</h1>
<p>The Color scheme was chosen with contrast in mind and <a href="https://github.com/LittleCanOpener/Final_Assessment?tab=readme-ov-file#webaim" target="_blank">WebAIM</a> Helped alot</p>
<ul>
    <li>
        <a href="https://www.color-hex.com/color/4d4d84" target="_blank">Primary Color</a><br>
        <img src="assets/images/color-scheme/color-purple.png">
    </li>
    <li>
        <a href="https://www.color-hex.com/color/3d3d3d" target="_blank">Secondary Color</a><br>
        <img src="assets/images/color-scheme/color-gray.png">
    </li>
    <li>
        <a href="https://www.color-hex.com/color/ffffff" target="_blank">Text Color</a><br>
        <img src="assets/images/color-scheme/color-white.png">
    </li>
    <li>
        <a href="https://www.color-hex.com/color/b8ddf9" target="_blank">Snake Color</a><br>
        <img src="assets/images/color-scheme/color-teal.png">
    </li>
    <li>
        <a href="https://www.color-hex.com/color/008000" target="_blank">Food Color</a><br>
        <img src="assets/images/color-scheme/color-green.png">
    </li>
</ul>
<h1>Technologies</h1>
<ol>
    <li>
        <h3>Git</h3><p>
        <img src="assets/images/icons/git.png" width="40px" height="40x"><br>
        Why <a href="https://git-scm.com/" target="_blank">Git</a>:<br>
        Git is a DevOps tool used for source code management. It is a free and open-source version control system used to handle small to very large projects efficiently. Git is used to tracking changes in the source code, enabling multiple developers to work together on non-linear development.
        </p><hr>
    </li>
    <li>
        <h3>Github</h3><p>
        <img src="assets/images/icons/github.png" width="40px" height="40x"><br>
        Why <a href="https://github.com/" target="_blank">Github</a>:<br>
        Well It's used for storing, tracking, and collaborating on software projects. It makes it easy for developers to share code files and collaborate with fellow developers on open-source projects. GitHub also serves as a social networking site where developers can openly network, collaborate, and pitch their work
        </p><hr>
    </li>
    <li>
        <h3>Github-Desktop</h3><p>
        <img src="assets/images/icons/github-desktop.png" width="40px" height="40x"><br>
        Why <a href="https://desktop.github.com/" target="_blank">Github-Desktop</a>:
        <br>If you're new to Git and GitHub, you may find it easier to use GitHub Desktop than to use Git on the command line. GitHub Desktop has a graphical user interface that simplifies commands and helps you visualize changes.<br>
        <small><a href="https://desktop.github.com/" target="_blank">Download here</a></small>
        </p><hr>
    </li>
    <li>
        <h3>Dart</h3><p>
        <img src="assets/images/icons/dart.png" width="40" height="40"><br>
        Why <a href="https://dart.dev/" target="_blank">Dart</a>:<br>
        Being a compiled language, Dart allows developers to discover programming errors during the compilation process.
        Hence, it is considered a type-safe language.
        On the other hand,
        Java is an interpreted language and allows developers to find programming errors during the runtime.
        </p>
        <details>
            <summary>Sources</summary>
            <a href="https://pub.dev/packages/snake" target="_blank">PubDev-Snake</a><br>
            <a href="https://pub.dev/documentation/snake/latest/snake/snake-library.html" target="_blank">PubDev-Snake-Library</a><br>
            <a href="https://pub.dev/packages/multiscreen/example" target="_blank">PubDev-MultiScreen</a><br>
        </details><hr>
    </li>
    <li>
        <h3>Flutter</h3><p>
        <img src="assets/images/icons/flutter.png" width="140px" height="40x"><br>
        Why <a href="https://docs.flutter.dev/" target="_blank">Flutter</a>:<br>Allows developers to build a single codebase and use it for several platforms such as the web, desktop and mobile. This results in quicker app launch and is cost effective. Reduced Development Time: The requirements for Flutter application development are much lower.<br>
        </p>
        <details>
            <summary>Sources</summary>
            <a href="https://docs.flutter.dev/release/archive?tab=windows" target="_blank">Flutter-SDK-Archive</a><br>
            <a href="https://docs.flutter.dev/add-to-app/multiple-flutters" target="_blank">Flutter-MultiScreen</a><br>
            <a href="https://docs.flutter.dev/ui/navigation" target="_blank">Flutter-Navigation-Routing</a><br>
        </details><hr>
    </li>
    <li>
        <h3>Android Studio</h3><p>
        <img src="assets/images/icons/android-studio.png" width="40px" height="40x"><br>
        Why <a href="https://developer.android.com/" target="_blank">Android Studio</a>:<br>Android Studio helps you debug and improve the performance of your code, including inline debugging and performance analysis tools.<br>
        <small><a href="https://developer.android.com/studio" target="_blank">Download here</a></small>
        </p><hr>
    </li>
    <li>
        <h3>Google Fonts</h3><p>
        <img src="assets/images/icons/googlefonts.png" width="40px" height="40x"><br>
        Why <a href="https://fonts.google.com/" target="_blank">Google Fonts</a>:<br>Google Fonts is a free and widely-used service provided by Google that offers a diverse collection of web fonts that can be easily embedded into websites.<br>
        What was used for this project <a href="https://fonts.google.com/specimen/Lemon" target="_blank">Lemon</a>.
        </p><hr>
    </li>
    <li>
        <h3>WebAIM</h3><p>
        <img src="assets/images/icons/webaim.png" width="150px" height="40x"><br>
        Why <a href="https://webaim.org/" target="_blank">WebAIM</a>:<br>WebAIM's mission is to expand the potential of the web for people with disabilities.<br> 
        We empower individuals and organizations to create and deliver accessible content by providing knowledge, technical skills, tools, organizational leadership strategies, and vision.<br>
        </p>
        <details>
        <summary>Contrast Screenshots.</summary>
        <p>
            <img src="assets/images/contrast-food-background.png"><br>
            <img src="assets/images/contrast-snake-background.png">
        </p>
        </details><hr>
    </li>
    <li>
        <h3>Chat-GPT</h3><p>
        <img src="assets/images/icons/chatgpt.png" width="40px" height="40x"><br>
        Why <a href="https://chat.openai.com/" target="_blank">ChatGPT 3.5</a>:<br>ChatGPT is a natural language processing tool driven by AI technology that allows you to have human-like conversations and much more with the chatbot. The language model can answer questions and assist you with tasks, such as composing emails, essays, and code. It's currently open to use by the public for free.<br>
        </p><details>
        <summary>Good to Know about ChatGPT Before Use:</summary>
        <ul>
        <li>
        <strong>Clearly Define Your Task:</strong>
            Clearly articulate your task or question. The more specific and detailed your input, the more focused and relevant the response will be.
        </li>
        <li>
            <strong>Iterative Questioning:</strong>
            If the initial response is not fully satisfying or if you need more details, try asking follow-up questions. This can help you refine your understanding and gather more information on the topic.
        </li>
        <li>
            <strong>Provide Context:</strong>
            Offer additional context or background information related to your question. This can help ChatGPT generate more accurate and relevant responses based on the context you provide.
        </li>
        <li>
            <strong>Experiment with Prompt Engineering:</strong>
            Play around with the way you structure your prompts. Sometimes, rephrasing or restructuring the question can lead to better or more informative responses.
        </li>
        <li>
            <strong>Specify the Level of Detail:</strong>
            If you're looking for a broad overview, make that clear. If you need a detailed explanation, specify that in your prompt. Tailoring your requests to the level of detail you seek can enhance the relevance of the responses.
        </li>
        <li>
            <strong>Explore Multiple Angles:</strong>
            Ask questions from different perspectives or angles to gain a more comprehensive understanding of the topic. This can help you uncover nuances and different facets of the information
        </li>
        <li>
            <strong>Verify Information:</strong>
            Use external sources to verify the information provided by ChatGPT. While the model is powerful, it's essential to cross-check the information for accuracy.
        </li>
        <li>
            <strong>Ask for Clarifications:</strong>
            If a response is ambiguous or unclear, ask for clarifications. This can help you get more precise information and avoid any misunderstandings.
        </li>
        <li>
            <strong>Take Notes:</strong>
            As you interact with ChatGPT, take notes on the information you find valuable. This can help you organize and remember the knowledge you gain during the session.<hr>
        </li>
        <li>
            Remember, while ChatGPT is a powerful tool, it's not infallible. Always verify critical information from reliable sources. Additionally, OpenAI continues to improve and update its models, so staying informed about any new features or changes can enhance your experience.
        </li>
        </ul>
        </details><hr>
    </li>
    <li>
        <h3>Balsamiq Wireframes</h3><p>
        <img src="assets/images/icons/balsamiq-wireframes.png" width="40px" height="40x"><br>
        Why <a href="https://balsamiq.com/" target="_blank">Balsamiq Wireframes</a>:<br>is a rapid low-fidelity UI wireframing tool that reproduces the experience of sketching on a notepad or whiteboard, but using a computer. It really forces you to focus on structure and content, avoiding lengthy discussions about colors and details that should come later in the process.<br>
        <details>
            <summary>WireFrame - Main Menu Screen</summary>
            <img src="assets/images/wireframes/wireframe-main.png"><br>
        </details>
        <details>
            <summary>WireFrame - Snake Game Screen</summary>
            <img src="assets/images/wireframes/wireframe-snake.png"><br>
        </details>
        <details>
            <summary>WireFrame - Score Screen</summary>
            <img src="assets/images/wireframes/wireframe-score.png"><br>
        </details>
        <details>
            <summary>WireFrame - Alert Screen</summary>
            <img src="assets/images/wireframes/wireframe-alert.png"><br>
        </details>
        </p><hr>
    </li>
    <li>
        <h3>Color-Hex</h3><p>
        <img src="https://www.color-hex.com/logo.png" width="80px" height="40x"><br>
        Why <a href="https://www.color-hex.com/" target="_blank">Color-Hex</a>:<br>Using hex color codes to represent different colors is an easy way to differentiate between colors. Once you understand how they work, you can easily change the red, blue, or green values to create a different shade.<br>
        </p><hr>
    </li>
</ol>
<h1>Special Thanks & Acknowledgements</h1>
<table>
<th>Teachers / Mentors:</th>
<tr>
    <td>Hjalti Agustsson 
        <a href="https://www.linkedin.com/in/hjaltiagustsson/?originalSubdomain=is" target="_blank">
        <img src="assets/images/icons/linkedin.png" width="20px" height="20x"></a>
    </td>
</tr>
<tr>
    <td>Gunnar Geir Helgason
        <a href="https://www.linkedin.com/in/gunnargh/?utm_source=share&utm_medium=member_mweb&utm_campaign=share_via&utm_content=profile&originalSubdomain=is" target="_blank"><img src="assets/images/icons/linkedin.png" width="20px" height="20x"></a>
    </td>
</tr>
<th>Youtube Guides:</th>
<tr>
    <td>SuperDeclarative!<a href="https://www.youtube.com/@SuperDeclarative" target="_blank"><img src="assets/images/icons/youtube.png" width="50px" height="25x"></a>
    </td>
</tr>
<tr>
    <td>dbestech<a href="https://www.youtube.com/@dbestech" target="_blank"><img src="assets/images/icons/youtube.png" width="50px" height="25x"></a>
    </td>
</tr>
<tr>
    <td>A Day Code<a href="https://www.youtube.com/@adaycode2972" target="_blank"><img src="assets/images/icons/youtube.png" width="50px" height="25x"></a>
    </td>
</tr>
<th>Images Used:</th>
<tr>
    <td><a href="https://www.pngwing.com/" target="_blank">PNG-Wing</a></td>
</tr>
<tr>
    <td><a href="https://www.pngegg.com/" target="_blank">PNG-EGG</a></td>
</tr>
<tr>
    <td><a href="https://www.pexels.com/" target="_blank">Pexels</a></td>
</tr>
</table>

