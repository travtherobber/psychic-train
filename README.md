# psychic-train
a little project playing with textual to make a terminal wrapper.

tui-wrap/
├── src/
│   └── tui_wrap/
│       ├── __init__.py       # Makes 'tui_wrap' a Python package.
│       ├── app.py            # The main Textual App class and entry point.
│       ├── widgets/          # Directory for custom Textual widgets (optional, but good)
│       │   ├── __init__.py
│       │   └── terminal_widget.py # Custom widget to display/handle terminal output.
│       ├── screens/          # Directory for different app views (e.g., Main, Settings)
│       │   ├── __init__.py
│       │   └── main_screen.py
│       └── tui.css           # Global Textual CSS file for styling the whole app.
│
├── tests/
│   ├── __init__.py
│   └── test_app.py           # Unit tests for core logic and Textual components.
│
├── README.md                 # Project description, installation, and usage guide.
├── pyproject.toml            # Project metadata (name, version, dependencies, entry points).
└── requirements.txt          # Quick list of dependencies for easy environment setup.
