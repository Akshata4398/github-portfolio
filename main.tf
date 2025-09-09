<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive DevOps Task Runner</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=Roboto+Mono:wght@400;500&display=swap" rel="stylesheet">
    <!-- Chosen Palette: Calm Neutrals with a Teal Accent -->
    <!-- Application Structure Plan: A two-column layout. The left column presents the DevOps task description and the script. The right column features an interactive terminal simulation and a detailed explanation of the script's components. This structure separates static information from interactive learning, allowing users to read the task details and then immediately engage with a simulated execution, reinforcing their understanding. Clicking script lines highlights explanations, creating a direct link between code and its purpose. -->
    <!-- Visualization & Content Choices: Report Info: Task Description -> Goal: Inform -> Presentation: Static Text Block -> Justification: Clearly sets the context for the user. Report Info: Bash Script -> Goal: Organize & Inform -> Presentation: Clickable Code Block -> Interaction: Highlights corresponding explanation -> Justification: Connects the 'what' (code) with the 'why' (explanation) interactively. Report Info: Explanations -> Goal: Inform -> Presentation: List -> Interaction: Is highlighted by script clicks -> Justification: Provides detailed context on demand. New Element: Terminal Simulation -> Goal: Engage & Demonstrate -> Presentation: Simulated Terminal UI -> Interaction: "Run Script" button types out command and shows output -> Justification: Provides a safe, hands-on experience that mimics real-world application, making the abstract concept concrete. All elements are implemented with HTML/CSS/JS. -->
    <!-- CONFIRMATION: NO SVG graphics used. NO Mermaid JS used. -->
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }
        .font-mono {
            font-family: 'Roboto Mono', monospace;
        }
        .highlight {
            background-color: #cce7f5;
            transition: background-color 0.3s ease;
            border-left: 4px solid #0d9488;
        }
        .code-line {
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }
        .code-line:hover {
            background-color: #e2e8f0;
        }
        .terminal-cursor {
            display: inline-block;
            background-color: #4ade80;
            animation: blink 1s step-end infinite;
        }
        @keyframes blink {
            from, to { background-color: transparent }
            50% { background-color: #4ade80; }
        }
    </style>
</head>
<body class="text-gray-800">

    <header class="bg-white shadow-sm">
        <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold leading-tight text-gray-900">Interactive DevOps Task Runner</h1>
            <p class="mt-1 text-md text-gray-600">A hands-on way to understand system administration scripts.</p>
        </div>
    </header>

    <main class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
            
            <div class="bg-white p-8 rounded-lg shadow-md">
                <h2 class="text-2xl font-bold mb-4 text-teal-700">Task Overview</h2>
                <div id="task-description" class="mb-8">
                    <h3 class="text-xl font-semibold mb-2">Create a User with a Non-Interactive Shell</h3>
                    <p class="text-gray-700">To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell.</p>
                </div>

                <div id="script-section">
                    <h3 class="text-xl font-semibold mb-3">The Script</h3>
                    <div class="bg-gray-800 text-white font-mono p-4 rounded-lg text-sm overflow-x-auto">
                        <pre><code id="code-block">
<span class="code-line" data-target="expl-1">#!/bin/bash</span>
<span class="code-line" data-target="expl-2"># Create a user named 'anita' with a non-interactive shell</span>
<span class="code-line" data-target="expl-3"># '/sbin/nologin' prevents the user from logging in via a shell.</span>
<span class="code-line" data-target="expl-4">useradd -s /sbin/nologin anita</span>

<span class="code-line" data-target="expl-5"># Check if the previous command was successful</span>
<span class="code-line" data-target="expl-6">if [ $? -eq 0 ]; then</span>
<span class="code-line" data-target="expl-7">    echo "User 'anita' was successfully created with a non-interactive shell."</span>
<span class="code-line" data-target="expl-8">else</span>
<span class="code-line" data-target="expl-9">    echo "Failed to create user 'anita'."</span>
<span class="code-line" data-target="expl-10">fi</span>
                        </code></pre>
                    </div>
                </div>
            </div>

            <div class="space-y-8">
                <div class="bg-white p-8 rounded-lg shadow-md">
                    <h2 class="text-2xl font-bold mb-4 text-teal-700">Interactive Terminal</h2>
                    <p class="text-gray-600 mb-4">Click "Run Script" to see a simulation of the command being executed on App Server 3.</p>
                    <div id="terminal" class="bg-gray-900 text-sm text-green-400 font-mono p-4 rounded-lg h-64 overflow-y-auto">
                        <p><span class="text-cyan-400">user@app-server-3</span>:<span class="text-yellow-300">~</span>$ <span id="terminal-command"></span><span id="cursor" class="terminal-cursor w-2 h-4">&nbsp;</span></p>
                        <div id="terminal-output"></div>
                    </div>
                    <div class="mt-4 flex justify-end">
                        <button id="runScriptBtn" class="bg-teal-600 hover:bg-teal-700 text-white font-bold py-2 px-4 rounded-lg transition duration-300">
                            Run Script
                        </button>
                    </div>
                </div>

                <div id="explanation-section" class="bg-white p-8 rounded-lg shadow-md">
                    <h2 class="text-2xl font-bold mb-4 text-teal-700">Code Explanation</h2>
                    <p class="text-gray-600 mb-4">Click on any line in the script to see its explanation highlighted here.</p>
                    <ul class="space-y-4">
                        <li id="expl-1" class="p-3 rounded-md transition duration-300"><strong>#!/bin/bash</strong>: This is a "shebang." It tells the system to execute this script using the Bash shell interpreter.</li>
                        <li id="expl-2" class="p-3 rounded-md transition duration-300"><strong># Create a user...</strong>: Lines starting with `#` are comments. They explain the code but are ignored by the computer.</li>
                        <li id="expl-3" class="p-3 rounded-md transition duration-300"><strong># '/sbin/nologin'...</strong>: Another comment providing more detail on the specific shell being used.</li>
                        <li id="expl-4" class="p-3 rounded-md transition duration-300"><strong>useradd -s /sbin/nologin anita</strong>: This is the core command. `useradd` creates a new user. The `-s` flag sets the user's login shell to `/sbin/nologin`, which is a special shell that prevents interactive logins. `anita` is the username being created.</li>
                        <li id="expl-5" class="p-3 rounded-md transition duration-300"><strong># Check if...</strong>: A comment explaining the purpose of the `if` block.</li>
                        <li id="expl-6" class="p-3 rounded-md transition duration-300"><strong>if [ $? -eq 0 ]; then</strong>: This starts a conditional block. It checks the exit code of the last command (`useradd`). `$?` holds the exit code, and `0` means success.</li>
                        <li id="expl-7" class="p-3 rounded-md transition duration-300"><strong>echo "..."</strong>: If the `useradd` command was successful, this line uses `echo` to print a success message to the terminal.</li>
                        <li id="expl-8" class="p-3 rounded-md transition duration-300"><strong>else</strong>: If the condition in the `if` statement was false (the exit code was not `0`), the code in this block will run.</li>
                        <li id="expl-9" class="p-3 rounded-md transition duration-300"><strong>echo "..."</strong>: This line prints a failure message to the terminal if the `useradd` command failed.</li>
                        <li id="expl-10" class="p-3 rounded-md transition duration-300"><strong>fi</strong>: This keyword marks the end of the `if` statement block.</li>
                    </ul>
                </div>
            </div>
        </div>
    </main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const runScriptBtn = document.getElementById('runScriptBtn');
        const terminalCommand = document.getElementById('terminal-command');
        const terminalOutput = document.getElementById('terminal-output');
        const cursor = document.getElementById('cursor');
        const codeLines = document.querySelectorAll('.code-line');
        const explanations = document.querySelectorAll('#explanation-section li');

        let isSimulationRunning = false;

        const commandToType = 'useradd -s /sbin/nologin anita';
        const successOutput = "User 'anita' was successfully created with a non-interactive shell.";

        function typeCommand(command, element, callback) {
            let i = 0;
            cursor.style.animation = 'none';
            cursor.style.backgroundColor = '#4ade80';
            
            function type() {
                if (i < command.length) {
                    element.textContent += command.charAt(i);
                    i++;
                    setTimeout(type, 50);
                } else {
                    cursor.style.animation = 'blink 1s step-end infinite';
                    if (callback) {
                        setTimeout(callback, 500);
                    }
                }
            }
            type();
        }

        function runSimulation() {
            if (isSimulationRunning) return;
            isSimulationRunning = true;
            runScriptBtn.disabled = true;
            runScriptBtn.classList.add('opacity-50', 'cursor-not-allowed');

            terminalCommand.textContent = '';
            terminalOutput.innerHTML = '';
            
            typeCommand(commandToType, terminalCommand, () => {
                const outputLine = document.createElement('p');
                outputLine.textContent = successOutput;
                terminalOutput.appendChild(outputLine);

                const newPrompt = document.createElement('p');
                newPrompt.innerHTML = `<span class="text-cyan-400">user@app-server-3</span>:<span class="text-yellow-300">~</span>$ <span class="terminal-cursor w-2 h-4">&nbsp;</span>`;
                terminalOutput.appendChild(newPrompt);
                
                isSimulationRunning = false;
                runScriptBtn.disabled = false;
                runScriptBtn.classList.remove('opacity-50', 'cursor-not-allowed');
            });
        }

        function highlightExplanation(targetId) {
            explanations.forEach(expl => {
                expl.classList.remove('highlight');
            });

            const targetElement = document.getElementById(targetId);
            if (targetElement) {
                targetElement.classList.add('highlight');
                targetElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }

        runScriptBtn.addEventListener('click', runSimulation);

        codeLines.forEach(line => {
            line.addEventListener('click', () => {
                const targetId = line.getAttribute('data-target');
                highlightExplanation(targetId);
            });
        });
    });
</script>

</body>
</html>
