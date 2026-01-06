{-# OPTIONS --cubical --guardedness #-}

module ChiRotationSimulation where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Equiv
open import Cubical.Foundations.Univalence

-- 【修正：インポートの再定義】
-- PsiStar の定義元である ChiCondensation を直接開くか、
-- TourbillonChiIntegration が re-export しているパスを確認します。
open import ChiCondensation using (PsiStar) -- 直接インポートすることでスコープを解決
open import TourbillonChiIntegration using (ChiSystem-v2; calculate-lambda)

-- ---------------------------------------------------------
-- 1. 旋回と反転のシミュレーター (AdS7/CFT6)
-- ---------------------------------------------------------

record RotationSim (chi : ChiSystem-v2) : Type₂ where
  field
    -- 【自己側の 2π 旋回】
    -- ビアンコーニ氏が物質場として定義した 1-form（ベクトル場）の動き [cite: 6, 29, 800, 831]。
    p-self : chi .ChiSystem-v2.aru-self ≡ chi .ChiSystem-v2.aru-self

  -- 【他者側へのドレッシング】
  -- スコープが解決されたことで、他者の現実（PsiStar）へのドレッシングが計算可能になります。
  p-other : PsiStar ≡ PsiStar
  p-other = ChiSystem-v2.arashimeru chi p-self