# dart-io-copy-path-test

A simple example of proposed `copyPathSync` usage

## Usage:

First install the `tree` command:

```
brew install tree

## or

apt-get install tree

```

Then create a simple directory tree:

```shell
./build-dir-tree.sh 
```

Output:

```text
+ mkdir dir-tree
+ cd dir-tree
+ mkdir a
+ echo AAA1
+ echo AAA2
+ mkdir b
+ echo BBB1
+ echo BBB2
+ ln -fs b c
+ cd ..
+ tree
.
├── bin
│   └── copy-path-test.dart
├── build-dir-tree.sh
├── dir-tree
│   ├── a
│   │   ├── a1.txt
│   │   └── a2.txt
│   ├── b
│   │   ├── b1.txt
│   │   └── b2.txt
│   └── c -> b
├── pubspec.lock
└── pubspec.yaml
```

Now run the `copyPathSync` test:

```shell
dart pub get

dart run bin/copy-path-test.dart dir-tree dir-tree2 dir-tree3
```

Output:

```text
** Copy path: /private/tmp/dart-io-copy-path-test/dir-tree -> /private/tmp/dart-io-copy-path-test/dir-tree2 [followLinks: false]
** Copy path: /private/tmp/dart-io-copy-path-test/dir-tree -> /private/tmp/dart-io-copy-path-test/dir-tree3 [followLinks: true]
```

Now see the created tree:

```shell
tree
```

Output:
```
.
├── bin
│   └── copy-path-test.dart
├── build-dir-tree.sh
├── dir-tree
│   ├── a
│   │   ├── a1.txt
│   │   └── a2.txt
│   ├── b
│   │   ├── b1.txt
│   │   └── b2.txt
│   └── c -> b
├── dir-tree2
│   ├── a
│   │   ├── a1.txt
│   │   └── a2.txt
│   ├── b
│   │   ├── b1.txt
│   │   └── b2.txt
│   └── c -> b
├── dir-tree3
│   ├── a
│   │   ├── a1.txt
│   │   └── a2.txt
│   ├── b
│   │   ├── b1.txt
│   │   └── b2.txt
│   └── c
│       ├── b1.txt
│       └── b2.txt
├── pubspec.lock
└── pubspec.yaml
```
