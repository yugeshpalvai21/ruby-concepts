# Ruby Concepts — Hands-on Learning Path

A self-contained set of runnable Ruby examples, ordered from fundamentals to
advanced topics. Each file is standalone: read the top comment, then run it and
compare the output with the inline `# => ...` expectations.

Verified on **Ruby 3.3** (runs on 3.0+). Notes call out features newer than 3.0
and what landed in **Ruby 4.0** (released Dec 2025).

## How to run

```bash
ruby 01_data_types.rb
ruby "06_conditionals_and _loops.rb"   # note: this filename has a space
ruby 19_meta_programming/define_method.rb
```

Every file prints labeled sections so you can follow along top-to-bottom.
Files that used to pause for keyboard input now use fixed sample values so they
run end-to-end; the interactive variant is shown in a comment.

## Learning path

### Fundamentals
| # | File | Covers |
|---|------|--------|
| 01 | `01_data_types.rb` | objects, classes, truthiness, type checks, ancestry |
| 02 | `02_strings_with_methods.rb` | creation, interpolation, transforms, regex slicing, formatting |
| 03 | `03_numbers_with_methods.rb` | Integer/Float/Rational, rounding, bases, float gotchas |
| 04 | `04_arrays.rb` | creation, slicing, map/select/reduce, chaining, destructuring |
| 05 | `05_hashes.rb` | symbol keys, fetch/dig, transform_*, merging, keyword-arg bridge |

### Control flow
| # | File | Covers |
|---|------|--------|
| 06 | `06_conditionals_and _loops.rb` | if/unless/ternary, case, while/until/loop, `&&` vs `and`, FizzBuzz |
| 07 | `07_case_with_ranges.rb` | case/when with ranges, types, regex; `===` explained |

### Methods & objects
| # | File | Covers |
|---|------|--------|
| 08 | `08_methods.rb` | defaults, keyword args, splat/double-splat, yield, `&block`, `...` |
| 09 | `09_classes_basics.rb` | initialize, attr_*, `to_s`/`inspect`, `==`, freeze, send |
| 10 | `10_classes_method_types.rb` | public/private/protected visibility |
| 11 | `11_classes_inheritence.rb` | `<`, `super`, class-instance vars, is_a?/instance_of? |
| 12 | `12_classes_self_keyword.rb` | `self` in every context, class methods, chaining |
| 13 | `13_modules.rb` | namespaces, include/extend/prepend, hooks, Comparable |

### Closures
| # | File | Covers |
|---|------|--------|
| 14 | `14_blocks.rb` | yield, block_given?, custom iterators via Enumerable |
| 15 | `15_procs.rb` | Proc objects, closures, `&`/symbol-to-proc, dispatch tables |
| 16 | `16_lambdas.rb` | lambda vs proc (arity + return), composition, currying |

### I/O
| # | File | Covers |
|---|------|--------|
| 17 | `17_files.rb` | read/write/append, line iteration, Pathname, JSON, cleanup |

### Advanced
| # | Folder / File | Covers |
|---|---------------|--------|
| 18 | `18_modules_everything/` | mixins (walk/swim), extend self, namespaced utilities |
| 19 | `19_meta_programming/` | open classes, refinements, `define_method`, `method_missing` + `respond_to_missing?`, monkey patching |
| 20 | `20_pattern_matching/` | `case/in` structural matching; regular expressions |
| 21 | `21_testing_with_ruby/` | RSpec: matchers, describe/context, hooks, mocks |

### Modern Ruby & robustness
| # | File | Covers |
|---|------|--------|
| 22 | `22_exceptions.rb` | begin/rescue/ensure/retry, custom errors, method-level rescue |
| 23 | `23_modern_ruby_features.rb` | 3.0→4.0: endless methods, hash shorthand, `Data`, `Set`, pattern matching, `&.`, ranges |

## Running the test project (folder 21)

The testing project uses Bundler + RSpec.

```bash
cd 21_testing_with_ruby
bundle install
bundle exec rspec          # documentation format, random order
bundle exec rspec --only-failures   # re-run just the last failures
```

It demonstrates equality/comparison/truthy/type/predicate matchers,
`raise_error`, `be_within` for floats, `describe`/`context` grouping,
`before` hooks, `let`/`subject`, and mocks (`double`, `receive`, `allow`).

## What changed in this revamp

- Added section headers, expected-output comments, and short explanations so
  each file reads as a mini-lesson.
- Replaced blocking `gets` input with fixed values so files run top-to-bottom.
- Modernized idioms: class-instance variables over `@@`, `transform_values`,
  endless methods, keyword-arg initializers, `Data`, safe navigation.
- Fixed bugs/typos (geometry labels, overlapping age ranges, dropped fields,
  `substaction` → `subtract`) and made misleading comments match the code.
- Demonstrated include/extend/prepend for real; paired `method_missing` with
  `respond_to_missing?`; showed refinements as the safe alternative to global
  monkey patching.
- Expanded pattern matching (find patterns, guards, `|`, pin `^`, `Struct`/
  `Data` deconstruction) and regex (captures, named groups, scan, gsub).
- Added exceptions (22) and a Ruby 3.0→4.0 feature tour (23).
