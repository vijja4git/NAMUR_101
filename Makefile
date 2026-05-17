# NAMUR 2-channel MS51 firmware — SDCC + host unit tests

SDCC       ?= sdcc
PACKIHX    ?= packihx
CC         ?= gcc

SDCCFLAGS  := -mmcs51 --model-small --std-sdcc99 --opt-code-size
INCLUDES   := -I include -I src/bsp -I src/app

FW_SRCS    := src/main.c src/bsp/ms51_bsp.c src/app/namur_logic.c
FW_REL     := build/main.rel build/ms51_bsp.rel build/namur_logic.rel
FW_IHX     := build/namur_firmware.ihx
FW_HEX     := build/namur_firmware.hex

TEST_BIN   := build/test_namur_logic
CHECK_BIN  := build/check_namur_thresholds

.PHONY: all firmware hex test check clean

all: hex

build:
	mkdir -p build

build/main.rel: src/main.c
	$(SDCC) $(SDCCFLAGS) $(INCLUDES) -c $< -o $@

build/ms51_bsp.rel: src/bsp/ms51_bsp.c
	$(SDCC) $(SDCCFLAGS) $(INCLUDES) -c $< -o $@

build/namur_logic.rel: src/app/namur_logic.c
	$(SDCC) $(SDCCFLAGS) $(INCLUDES) -c $< -o $@

firmware: $(FW_IHX)

$(FW_IHX): $(FW_REL)
	$(SDCC) $(SDCCFLAGS) $(FW_REL) -o $@

hex: firmware
	$(PACKIHX) $(FW_IHX) > $(FW_HEX)
	@echo "Hex: $(FW_HEX)"

test: build $(TEST_BIN) $(CHECK_BIN)
	./$(TEST_BIN)
	./$(CHECK_BIN)
	@echo "Host tests OK"

$(TEST_BIN): tests/test_namur_logic.c src/app/namur_logic.c
	$(CC) -Wall -Wextra -std=c99 $(INCLUDES) -o $@ tests/test_namur_logic.c src/app/namur_logic.c

$(CHECK_BIN): tests/check_namur_thresholds.c
	$(CC) -Wall -Wextra -std=c99 -I include -o $@ tests/check_namur_thresholds.c

check: $(CHECK_BIN)
	./$(CHECK_BIN)

clean:
	rm -rf build
