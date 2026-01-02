{-# OPTIONS --cubical --guardedness #-}

module SoulSpace_Cube where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Empty

-- =======================================================
-- SoulSpace: 点（self / other）を持つ空間
-- =======================================================

data SoulSpace : Type where
  self  : SoulSpace
  other : SoulSpace

-- 【重要】まず最初に「実体」を定義します
postulate
  p-spin     : self ≡ self
  n-link     : self ≡ other
  neutralize : (p-spin ∙ n-link) ≡ n-link
  p-full     : (p-spin ∙ p-spin) ≡ refl
  -- Prelude の外にある場合のための基礎法則
  lUnit : {A : Type} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p

-- 否定（非等号）の定義
_≢_ : {A : Type} → A → A → Type
x ≢ y = (x ≡ y) → ⊥

-- =======================================================
-- Nucleus（原子核）
-- =======================================================

record Nucleus : Type where
  field
    proton   : self ≡ self
    neutron  : self ≡ other
    coupling : proton ∙ neutron ≡ neutron

open Nucleus

ψ7-8-AtomicCore : Nucleus
ψ7-8-AtomicCore = record
  { proton   = p-spin
  ; neutron  = n-link
  ; coupling = neutralize
  }

-- =======================================================
-- 最初の定理：二回転の相殺
-- =======================================================

-- 括弧 ((p-spin ∙ p-spin) ∙ n-link) で境界をピタリと合わせます
spin-twice-is-identity : ((p-spin ∙ p-spin) ∙ n-link) ≡ n-link
spin-twice-is-identity =
  ((p-spin ∙ p-spin) ∙ n-link)
  ≡⟨ cong (_∙ n-link) p-full ⟩
  (refl ∙ n-link)
  ≡⟨ lUnit n-link ⟩
  n-link ∎