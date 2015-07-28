#include <vesp/Main.hpp>
#include <Windows.h>

int CALLBACK WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	auto gameBuildId = "Afterdawn (" __DATE__ " " __TIME__ ")";

	if (!vesp::Initialize(gameBuildId))
		return 1;

	LogInfo(gameBuildId);

	vesp::Loop();

	vesp::Shutdown();

	return 0;
}