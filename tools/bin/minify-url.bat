@ECHO OFF

if ["%1"] == [""] (goto:help)
if ["%1"] == ["--help"] (goto:help)
if ["%1"] == ["-h"] (goto:help)
if ["%1"] == ["/?"] (goto:help)

set src=%1
set src=%src:\=/%
set dest=%2
set dest=%dest:\=/%
if ["%~2"] == [""] (
	bash -c "echo -n javascript:$(minify %src%)"
) else (
	bash -c "echo -n javascript:$(minify %src%)>%dest%"
)

goto:eof

:help
	echo usage: minify-url input.js [output.js]
	echo.       minify-url input.js ^| clip