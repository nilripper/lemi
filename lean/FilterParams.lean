import Mathlib

/-!
# Filter Parameters

Defines `ValidParams` — the validated parameter record that serves as the
sole hypothesis of all filter stability theorems in this library.
-/

/-- Validated parameters for a parametric biquad filter. All constraints
    are embedded as field hypotheses, making any `ValidParams` structurally
    correct by construction. -/
structure ValidParams where
  f0   : ℝ  -- centre frequency (Hz)
  fs   : ℝ  -- sample rate (Hz)
  q    : ℝ  -- quality factor
  gain : ℝ  -- shelf/peaking gain (dB), may be negative
  s    : ℝ  -- shelf slope in (0, 1]
  hf0      : 0 < f0
  hfs      : 0 < fs
  hNyquist : f0 < fs / 2
  hq       : 0 < q
  hs       : 0 < s
  hs1      : s ≤ 1
