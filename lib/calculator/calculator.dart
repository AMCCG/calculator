import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<String>(
  (ref) => "0",
);
final equationAProvider = StateProvider<String>(
  (ref) => "",
);
final operatorProvider = StateProvider<String>(
  (ref) => "",
);
final isReplaceProvider = StateProvider<bool>(
  (ref) => false,
);

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScreenContainer(),
          ButtonGroupContainer(),
        ],
      ),
    );
  }
}

class ButtonGroupContainer extends ConsumerWidget {
  const ButtonGroupContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          const MFunctionRow(),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "%",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      clear(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "CE",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      clearAll(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      delete(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Del",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "fraction",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Pow",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "sqrt",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      division(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "/",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "7");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "7",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "8");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "8",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "9");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "9",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      multiplication(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "x",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "4");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "4",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "5");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "5",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "6");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "6",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      subtraction(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "1");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "2");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "3");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "3",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      addition(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "+/-",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      append(ref, "0");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      toDecimal(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white38),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        ".",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.247,
                  child: ElevatedButton(
                    onPressed: () {
                      calculate(ref);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "=",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }

  void calculate(WidgetRef ref) {
    if (ref.read(equationAProvider.notifier).state.isNotEmpty &&
        ref.read(operatorProvider.notifier).state.isNotEmpty) {
      double total = 0;
      if (ref.read(operatorProvider.notifier).state == "+") {
        total = double.parse(ref.read(equationAProvider.notifier).state) +
            double.parse(ref.read(counterProvider.notifier).state);
      } else if (ref.read(operatorProvider.notifier).state == "-") {
        total = double.parse(ref.read(equationAProvider.notifier).state) -
            double.parse(ref.read(counterProvider.notifier).state);
      } else if (ref.read(operatorProvider.notifier).state == "*") {
        total = double.parse(ref.read(equationAProvider.notifier).state) *
            double.parse(ref.read(counterProvider.notifier).state);
      } else if (ref.read(operatorProvider.notifier).state == "/") {
        total = double.parse(ref.read(equationAProvider.notifier).state) /
            double.parse(ref.read(counterProvider.notifier).state);
      }
      if (total.toString().endsWith(".0")) {
        ref.read(counterProvider.notifier).state = total.toInt().toString();
      } else {
        ref.read(counterProvider.notifier).state = total.toString();
      }
    }
  }

  void clear(WidgetRef ref) {
    ref.read(counterProvider.notifier).state = "0";
  }

  void clearAll(WidgetRef ref) {
    ref.read(equationAProvider.notifier).state = "";
    ref.read(operatorProvider.notifier).state = "";
    ref.read(counterProvider.notifier).state = "0";
  }

  void append(WidgetRef ref, String value) {
    if (ref.read(counterProvider.notifier).state == "0" ||
        ref.read(isReplaceProvider.notifier).state) {
      ref.read(counterProvider.notifier).state = value;
    } else {
      ref.read(counterProvider.notifier).state += value;
      ref.read(isReplaceProvider.notifier).state = false;
    }
  }

  void delete(WidgetRef ref) {
    int length = ref.read(counterProvider.notifier).state.length;
    if (length > 1) {
      ref.read(counterProvider.notifier).state =
          ref.read(counterProvider.notifier).state.substring(0, length - 1);
    }
  }

  void addition(WidgetRef ref) {
    ref.read(equationAProvider.notifier).state =
        ref.read(counterProvider.notifier).state;
    ref.read(operatorProvider.notifier).state = "+";
    ref.read(isReplaceProvider.notifier).state = true;
  }

  void subtraction(WidgetRef ref) {
    ref.read(equationAProvider.notifier).state =
        ref.read(counterProvider.notifier).state;
    ref.read(operatorProvider.notifier).state = "-";
    ref.read(isReplaceProvider.notifier).state = true;
  }

  void multiplication(WidgetRef ref) {
    ref.read(equationAProvider.notifier).state =
        ref.read(counterProvider.notifier).state;
    ref.read(operatorProvider.notifier).state = "*";
    ref.read(isReplaceProvider.notifier).state = true;
  }

  void division(WidgetRef ref) {
    ref.read(equationAProvider.notifier).state =
        ref.read(counterProvider.notifier).state;
    ref.read(operatorProvider.notifier).state = "/";
    ref.read(isReplaceProvider.notifier).state = true;
  }

  void toDecimal(WidgetRef ref) {
    if (!ref.read(counterProvider.notifier).state.contains(".")) {
      ref.read(counterProvider.notifier).state =
          double.parse(ref.read(counterProvider.notifier).state.toString())
              .toString();
    }
  }
}

class ScreenContainer extends ConsumerWidget {
  const ScreenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(counterProvider);
    final String equationA = ref.watch(equationAProvider);
    final String operator = ref.watch(operatorProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15),
          child: Text(
            "$equationA $operator",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 15),
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(fontSize: 80, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class MFunctionRow extends StatelessWidget {
  const MFunctionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "MC",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "MR",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "M+",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "M-",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "MS",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "M",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
