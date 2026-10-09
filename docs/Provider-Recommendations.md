# Kalkumpel — Provider Recommendations

| Area | My recommendation | Why it fits your app |
|---|---|---|
| **UI / design** | Existing React Native components; [React Native Paper](https://oss.callstack.com/react-native-paper/) where needed | Customize your existing screens, charts, colors, and branding. Paper supplies standard controls. |
| **Authentication** | [Supabase Auth](https://supabase.com/docs/guides/auth) | Already integrated; supports email/password and social sign-in. |
| **Database and photos** | [Supabase Postgres + Storage](https://supabase.com/) | Stores accounts, meal logs, weight records, and photos with per-user access controls. |
| **Mobile subscriptions** | [RevenueCat](https://www.revenuecat.com/) | Manages subscriptions and paid access through Apple and Google billing. |
| **Website payments** | [Stripe Checkout + Billing](https://stripe.com/payments/checkout), if needed | Handles subscriptions purchased through your website. |
| **AI food analysis** | [Anthropic Claude](https://platform.claude.com/) initially | Already integrated; identifies foods and estimates portions. Test models for accuracy and cost. |
| **German nutrition data** | [Bundeslebensmittelschlüssel—BLS](https://www.blsdb.de/) | German reference data for ingredients and prepared dishes. BLS 4.0 is free open data under CC BY 4.0. |
| **US nutrition data** | [USDA FoodData Central](https://fdc.nal.usda.gov/) | US food and nutrient reference data, including generic ingredients and branded products. |
| **Barcode lookups—Germany and USA** | [Open Food Facts](https://world.openfoodfacts.org/) | Retrieves packaged-product nutrition by barcode. Users specify the amount eaten; coverage varies by product. |

## Nutrition data sources

- [BLS — official database and downloads](https://www.blsdb.de/)
- [BLS — Max Rubner-Institut overview and license](https://www.mri.bund.de/de/institute/ernaehrungsverhalten/forschungsbereiche/bundeslebensmittelschluessel-bls/)
- [USDA FoodData Central — API guide](https://fdc.nal.usda.gov/api-guide/)
- [Open Food Facts — API documentation](https://openfoodfacts.github.io/openfoodfacts-server/api/)
- [Open Food Facts — license and reuse conditions](https://openfoodfacts.github.io/openfoodfacts-server/api/tutorials/license-be-on-the-legal-side/)

BLS uses CC BY 4.0 with attribution requirements. Open Food Facts uses ODbL with attribution and database reuse conditions. Photo-based nutrition remains an estimate; users should be able to correct ingredients and portions.
