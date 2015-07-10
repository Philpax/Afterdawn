#include <vesp/Main.hpp>

int main()
{
	auto gameBuildId = "Afterdawn (" __DATE__ " " __TIME__ ")";

	if (!vesp::Initialize(gameBuildId))
		return 1;

	LogInfo(gameBuildId);

	vesp::Loop();

	vesp::Shutdown();

	return 0;
}