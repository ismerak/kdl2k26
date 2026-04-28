from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Input, Button, Static
from textual.containers import Vertical, Center
import subprocess

class DownloaderApp(App):
    BINDINGS = [("d", "toggle_dark", "Toggle dark mode"), ("q", "quit", "Quit")]

    CSS = """
    Screen {
        align: center middle;
    }

    #main_container {
        width: 60;
        height: 18;
        border: thick $primary;
        background: $surface;
        padding: 1 2;
    }

    #title {
        text-align: center;
        width: 100%;
        text-style: bold;
        margin-bottom: 1;
        color: $accent;
    }

    Input {
        margin-bottom: 1;
    }

    Button {
        width: 100%;
        margin-bottom: 1;
    }

    #status_log {
        text-align: center;
        margin-top: 1;
        height: 1;
    }
    """

    def compose(self) -> ComposeResult:
        yield Header()
        with Vertical(id="main_container"):
            yield Static("VIDEO DOWNLOADER TOOL", id="title")
            yield Input(placeholder="Paste video link here (TikTok, YT, FB)...", id="url_input")
            yield Button("Download MP4 (Video)", variant="success", id="download_mp4")
            yield Button("Download MP3 (Audio)", variant="primary", id="download_mp3")
            yield Static("", id="status_log")
        yield Footer()

    def on_button_pressed(self, event: Button.Pressed) -> None:
        url = self.query_one("#url_input").value
        status = self.query_one("#status_log")

        if not url:
            status.update("[bold red]Please enter a URL first![/bold red]")
            return

        # Run the download in a worker thread to prevent UI freezing
        self.run_worker(self.download_task(url, event.button.id), thread=True)

    async def download_task(self, url: str, action: str) -> None:
        status = self.query_one("#status_log")
        if action == "download_mp4":
            status.update("[bold green]Downloading MP4...[/bold green]")
            subprocess.run(["yt-dlp", "-f", "best", url])
            status.update("[bold green]Download Complete![/bold green]")
        elif action == "download_mp3":
            status.update("[bold blue]Downloading MP3...[/bold blue]")
            subprocess.run(["yt-dlp", "-x", "--audio-format", "mp3", url])
            status.update("[bold blue]Download Complete![/bold blue]")

if __name__ == "__main__":
    DownloaderApp().run()