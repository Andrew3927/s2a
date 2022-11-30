#ifndef EMIT_H
#define EMIT_H
//.fmtstr:	.string	"%d"
#define INPUT_FORMAT_STR_NAME  	".input_fmtstr"
#define OUTPUT_FORMAT_STR_NAME 	".output_fmtstr"

#define GEN_ASSEMBLE_WITH_FILE_LINENO

#ifdef GEN_ASSEMBLE_WITH_FILE_LINENO

void DoEmitAssembly(const char *fmt, ...);

#define EmitAssembly(fmt, ...)                                     \
	do                                                             \
	{                                                              \
		fprintf(stdout, "\t");                                     \
		DoEmitAssembly(fmt, ##__VA_ARGS__);                        \
		fprintf(stdout, "\t\t\t# (%s, %d)\n", __FILE__, __LINE__); \
	} while (0)

#else

void EmitAssembly(const char *fmt, ...);

#endif

void EmitLabel(const char *fmt, ...);

void EmitPrologue(int frameSize);
void EmitEpilogue(void);

#endif
