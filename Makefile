EF		= ['_main', '_initializeParticleSystem', '_getParticleArraySize', '_getParticleArrayPointer', '_getParticleStructSize', '_updateParticles', '_setTimeScale']
EERM	= ['ccall', 'cwrap', 'getValue']

PORT	= 5500

STATIC_DIR 	= ./static
OUT_DIR 		= $(STATIC_DIR)/build
SRC_DIR 		= ./src

clean: $(OUT_DIR)
	-rm -rf $(OUT_DIR)

main: $(SRC_DIR)/main.c $(SRC_DIR)/main.h $(SRC_DIR)/lib.c $(SRC_DIR)/config.h
	-mkdir -p $(OUT_DIR)
	-emcc -s "EXTRA_EXPORTED_RUNTIME_METHODS=$(EERM)" \
				-s "EXPORTED_FUNCTIONS=$(EF)" \
				-s WASM=1 \
				$(SRC_DIR)/main.c -o $(OUT_DIR)/compiled.js

serve: $(STATIC_DIR)
	-emrun --no_browser --port $(PORT) $(STATIC_DIR)/index.html