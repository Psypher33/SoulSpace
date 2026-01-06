{-# OPTIONS --cubical --guardedness #-}

module ChiCondensation where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Equiv
open import Cubical.Foundations.Isomorphism
open import GenshiyouCore_v44 using (SoulSpace; self; other)
open import CondensationStrict using (PsiSystem)

-- ---------------------------------------------------------
-- 1. 他者側の精神空間 (Psi-Star) 
-- ---------------------------------------------------------

record PsiStar : Type₁ where
  field
    content : PsiSystem

-- ---------------------------------------------------------
-- 2. 四つの相と G-フィールドを統合した ChiSystem
-- ---------------------------------------------------------

record ChiSystem : Type₂ where
  field
    -- 「ある」：前提としての裸の計量
    aru-self  : Type₁
    aru-other : Type₁

    -- 「いる」：他者の内面へと開かれた広がり
    iru-field : aru-self ≃ PsiStar

    -- 「なる」：ビアンコーニ氏の G-フィールド（制約のリンク）
    G-field : aru-self ≡ aru-other

  -- 「あらしめる」：ドレッシング（修飾）演算
  arashimeru : (p-self : aru-self ≡ aru-self) → (aru-other ≡ aru-other)
  arashimeru p-self = (sym G-field) ∙ p-self ∙ G-field

  -- 創発的な宇宙定数（G-フィールドに依存する安定構造）
  cosmological-constant : (p : aru-self ≡ aru-self) → Type₂
  cosmological-constant p = arashimeru p ≡ arashimeru p

-- ---------------------------------------------------------
-- 3. 評価：同時性の伝播
-- ---------------------------------------------------------

propagate-promotion : (chi : ChiSystem) 
                    → (p : chi .ChiSystem.aru-self ≡ chi .ChiSystem.aru-self) 
                    → chi .ChiSystem.aru-other ≡ chi .ChiSystem.aru-other
-- 【修正ポイント】語順を整理して「法則(ChiSystem)・力(arashimeru)・対象(chi)・引数(p)」とします
propagate-promotion chi p = ChiSystem.arashimeru chi p